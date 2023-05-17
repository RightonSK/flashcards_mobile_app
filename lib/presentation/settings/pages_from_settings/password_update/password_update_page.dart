import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcards_mobile_app/app_theme.dart';
import 'package:flashcards_mobile_app/presentation/login_and_register/login_and_register_page.dart';
import 'package:flashcards_mobile_app/presentation/settings/pages_from_settings/password_update/password_update_viewmodel.dart';
import 'package:flashcards_mobile_app/utils/convert_to_error_message_util.dart';
import 'package:flashcards_mobile_app/utils/navigation_util.dart';
import 'package:flashcards_mobile_app/utils/notification_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PasswordUpdatePage extends ConsumerWidget {
  const PasswordUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordUpdateViewModel = ref.watch(passwordUpdateProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('パスワード設定'),
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              TextField(
                controller: passwordUpdateViewModel.currentPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '現在のパスワード',
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              // password text field
              TextField(
                controller: passwordUpdateViewModel.newPasswordController,
                obscureText: true,
                decoration: InputDecoration(labelText: '新しいパスワード'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller:
                    passwordUpdateViewModel.newPasswordToConfirmController,
                obscureText: true,
                decoration: InputDecoration(labelText: '新しいパスワード(確認)'),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      //ログインパスワードの更新
                      await passwordUpdateViewModel.updatePassword();
                      //更新成功後、通知用ダイアログ
                      await NotificationUtil.showTextDialog(
                          context: context, message: 'パスワードを変更しました');
                      //その後、ログイン画面に戻る
                      await NavigationUtil.pushAndRemoveAll(
                          context: context,
                          fullscreenDialog: true,
                          page: const LoginAndRegisterPage());
                    } on FirebaseAuthException catch (e) {
                      await NotificationUtil.showTextDialog(
                          context: context,
                          message:
                              ConvertToErrorMessageUtil.convertErrorMessage(
                                  e.code));
                    } on FormatException catch (e) {
                      await NotificationUtil.showTextDialog(
                          context: context, message: e.message);
                    } catch (e) {
                      NotificationUtil.showTextSnackBar(
                          context: context,
                          message:
                              ConvertToErrorMessageUtil.convertErrorMessage(
                                  ''));
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '変更する',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

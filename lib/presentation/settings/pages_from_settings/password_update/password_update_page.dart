import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcards_mobile_app/app_theme.dart';
import 'package:flashcards_mobile_app/presentation/settings/pages_from_settings/password_update/password_update_viewmodel.dart';
import 'package:flashcards_mobile_app/utils/convert_to_error_message_util.dart';
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
                      //成功したら、通知用ダイアログ
                      print('パスワードを変更しました');
                      await NotificationUtil.showTextDialog(
                          context: context, message: 'パスワードを変更しました');
                      //その後、前の画面に戻る
                      Navigator.of(context).pop();
                    } on FirebaseAuthException catch (e) {
                      print(e.code);
                      await NotificationUtil.showTextDialog(
                          context: context,
                          message:
                              ConvertToErrorMessageUtil.convertErrorMessage(
                                  e.code));
                    } on FormatException catch (e) {
                      await NotificationUtil.showTextDialog(
                          context: context, message: e.toString());
                    } catch (e) {
                      NotificationUtil.showTextSnackBar(context, '不明なエラーです');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.mainColor,
                    foregroundColor: Colors.black,
                    elevation: 3.0,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '変更する',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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

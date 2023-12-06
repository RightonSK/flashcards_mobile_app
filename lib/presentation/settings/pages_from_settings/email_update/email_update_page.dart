import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcards_mobile_app/presentation/login_and_register/login_and_register_page.dart';
import 'package:flashcards_mobile_app/presentation/settings/pages_from_settings/email_update/email_update_notifier.dart';
import 'package:flashcards_mobile_app/utils/convert_to_error_message_util.dart';
import 'package:flashcards_mobile_app/utils/navigation_util.dart';
import 'package:flashcards_mobile_app/utils/notification_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmailUpdatePage extends ConsumerWidget {
  const EmailUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailUpdateState = ref.watch(emailUpdateProvider);
    final emailUpdateNotifier = ref.watch(emailUpdateProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('メールアドレス設定'),
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('現在のメールアドレス'),
              Text(emailUpdateState.email),
              TextField(
                decoration: const InputDecoration(
                    labelText: 'メールアドレス', hintText: 'メールアドレス'),
                controller: emailUpdateNotifier.emailController,
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () async {
                  try {
                    emailUpdateNotifier.checkEmailFormat();
                    final isLoggedIn = await _showBottomSheet(context, ref);
                    // 再ログインに成功した場合
                    if (isLoggedIn) {
                      try {
                        await emailUpdateNotifier.updateEmail();
                        //更新成功後、通知用ダイアログ
                        await NotificationUtil.showTextDialog(
                            context: context, message: 'メールアドレスを変更しました');
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
                      }
                    }
                  } on FormatException catch (e) {
                    await NotificationUtil.showTextDialog(
                        context: context, message: e.message);
                  } catch (e) {
                    NotificationUtil.showTextSnackBar(
                        context: context,
                        message:
                            ConvertToErrorMessageUtil.convertErrorMessage(''));
                  }
                },
                child: const Text('変更'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<bool> _showBottomSheet(BuildContext context, WidgetRef ref) async {
  final emailUpdateState = ref.watch(emailUpdateProvider);
  final emailUpdateNotifier = ref.watch(emailUpdateProvider.notifier);
  final deviceHeight = MediaQuery.of(context).size.height;
  final unSafeAreaTop = MediaQuery.of(context).padding.top;
  final bottomSheetHeight =
      deviceHeight - unSafeAreaTop - AppBar().preferredSize.height;
  return await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            height: bottomSheetHeight,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
              child: Column(
                children: [
                  const Text('現在のメールアドレス'),
                  Text(emailUpdateState.email),
                  TextField(
                    controller: emailUpdateNotifier.passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'パスワード'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await emailUpdateNotifier.reLogin();
                        //ログイン成功時、trueを返す
                        Navigator.of(context).pop(true);
                      } on FormatException catch (e) {
                        await NotificationUtil.showTextDialog(
                            context: context, message: e.message);
                      } on FirebaseAuthException catch (e) {
                        await NotificationUtil.showTextDialog(
                            context: context,
                            message:
                                ConvertToErrorMessageUtil.convertErrorMessage(
                                    e.code));
                        // firebase authエラーの時は、ボトムシートを閉じる
                        Navigator.of(context).pop(false);
                      } catch (e) {
                        //その他のエラーの場合、ボトムシートを閉じ、スナックバーを表示
                        Navigator.of(context).pop(false);
                        Future.delayed(const Duration(milliseconds: 500));
                        NotificationUtil.showTextSnackBar(
                            context: context,
                            message:
                                ConvertToErrorMessageUtil.convertErrorMessage(
                                    ''));
                      }
                    },
                    child: const Text('確認'),
                  ),
                ],
              ),
            ),
          );
        },
      ) ??
      false;
}

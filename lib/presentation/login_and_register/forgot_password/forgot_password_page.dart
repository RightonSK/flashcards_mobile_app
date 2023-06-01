import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcards_mobile_app/app_theme.dart';
import 'package:flashcards_mobile_app/presentation/login_and_register/forgot_password/forgot_password_viewmodel.dart';
import 'package:flashcards_mobile_app/utils/convert_to_error_message_util.dart';
import 'package:flashcards_mobile_app/utils/convert_to_user_util.dart';
import 'package:flashcards_mobile_app/utils/notification_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ForgotPasswordPage extends ConsumerWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const _ForgotPasswordPageBody(),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.close),
                // close iconを押されたら、top pageに戻る。
                onPressed: () async {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ForgotPasswordPageBody extends ConsumerWidget {
  const _ForgotPasswordPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forgotPasswordViewModel = ref.watch(forgotPasswordProvider.notifier);
    final appBarHeight = AppBar().preferredSize.height;

    return Padding(
      padding: EdgeInsets.fromLTRB(25.0, appBarHeight, 25.0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('ご入力のメールアドレス宛に、新しいパスワードを作成するリンクを送信します。'),
          const SizedBox(
            height: 16.0,
          ),
          TextField(
            controller: forgotPasswordViewModel.emailController,
            decoration: const InputDecoration(
              labelText: 'メールアドレス',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                try {
                  // メールアドレスを送信
                  await forgotPasswordViewModel.sendEmailToResetPassword();
                  //成功したら前の画面に遷移
                  Navigator.of(context).pop();
                } on FirebaseAuthException catch (e) {
                  NotificationUtil.showTextSnackBar(
                      context: context,
                      message: ConvertToErrorMessageUtil.convertErrorMessage(
                          e.code));
                } catch (e) {
                  NotificationUtil.showTextSnackBar(
                      context: context,
                      message:
                          ConvertToErrorMessageUtil.convertErrorMessage(''));
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '送信',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcards_mobile_app/presentation/login_and_register/forgot_password/forgot_password_viewmodel.dart';
import 'package:flashcards_mobile_app/utils/convert_to_error_message_util.dart';
import 'package:flashcards_mobile_app/utils/convert_to_user_util.dart';
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: forgotPasswordViewModel.emailController,
            decoration: InputDecoration(
              labelText: 'メールアドレス',
            ),
          ),
          const SizedBox(
            height: 10,
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
                  _showSnackBar(context,
                      ConvertToErrorMessageUtil.convertErrorMessage(e.code));
                } on FormatException catch (e) {
                  _showSnackBar(context, e.message);
                }
              },
              child: Padding(
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

_showSnackBar(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.blue,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      content: Text(errorMessage),
    ),
  );
}

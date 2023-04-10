import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final forgotPasswordProvider =
    StateNotifierProvider.autoDispose<ForgotPasswordViewModel, void>(
        (ref) => ForgotPasswordViewModel());

class ForgotPasswordViewModel extends StateNotifier<void> {
  ForgotPasswordViewModel() : super(null);
  final emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  Future<void> sendEmailToResetPassword() async {
    if (emailController.text.isEmpty) {
      throw const FormatException('メールアドレスを入力してください');
    }
    await _auth.sendPasswordResetEmail(email: emailController.text.trim());
  }
}

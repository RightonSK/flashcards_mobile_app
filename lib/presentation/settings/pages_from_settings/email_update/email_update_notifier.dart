import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcards_mobile_app/presentation/settings/pages_from_settings/email_update/email_update_state.dart';
import 'package:flashcards_mobile_app/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final emailUpdateProvider =
    StateNotifierProvider.autoDispose<EmailUpdateNotifier, EmailUpdateState>(
        (ref) => EmailUpdateNotifier(EmailUpdateState()));

class EmailUpdateNotifier extends StateNotifier<EmailUpdateState> {
  EmailUpdateNotifier(EmailUpdateState state) : super(state) {
    init();
  }

  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final _userRepository = UserRepository();

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    emailController.dispose();
  }

  ///
  /// init処理
  ///
  void init() {
    if (FirebaseAuth.instance.currentUser != null) {
      state = state.copyWith(email: FirebaseAuth.instance.currentUser!.email!);
    }
  }

  ///
  /// メールアドレス変更のための再度ログイン用メソッド
  ///
  Future<void> reLogin() async {
    try {
      await _userRepository.logIn(
          email: state.email, password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      passwordController.clear();
      rethrow;
    }
  }

  ///
  /// emailを変更
  ///
  Future<void> updateEmail() async {
    try {
      await _userRepository.updateEmail(newEmail: emailController.text.trim());
      print("Email updated successfully.");
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      passwordController.clear();
      emailController.clear();
      rethrow;
    }
  }
}

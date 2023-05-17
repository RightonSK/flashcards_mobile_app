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
  /// メールアドレスのフォーマットを確認
  ///
  void checkEmailFormat() {
    RegExp regExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      caseSensitive: false,
      multiLine: false,
    );
    bool isValid = regExp.hasMatch(emailController.text.trim());
    if (emailController.text.isEmpty) {
      throw const FormatException('メールアドレスを入力してください');
    }
    if (!isValid) {
      throw const FormatException('メールアドレスを正しい形式で入力してください');
    }
  }

  ///
  /// メールアドレス変更のための再度ログイン用メソッド
  ///
  Future<void> reLogin() async {
    if (passwordController.text.isEmpty) {
      throw const FormatException('パスワードを入力してください');
    }
    try {
      await _userRepository.logIn(
          email: state.email, password: passwordController.text.trim());
    } catch (e) {
      emailController.clear();
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
    } catch (e) {
      passwordController.clear();
      emailController.clear();
      rethrow;
    }
  }
}

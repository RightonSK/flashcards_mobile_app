import 'package:flashcards_mobile_app/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final passwordUpdateProvider =
    StateNotifierProvider.autoDispose<PasswordUpdateViewModel, void>(
        (ref) => PasswordUpdateViewModel());

class PasswordUpdateViewModel extends StateNotifier<void> {
  PasswordUpdateViewModel() : super(null);
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final newPasswordToConfirmController = TextEditingController();
  final _userRepository = UserRepository();

  @override
  void dispose() {
    super.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    newPasswordToConfirmController.dispose();
  }

  ///
  /// ログインパスワードの更新
  ///
  Future<void> updatePassword() async {
    throw Exception();

    if (currentPasswordController.text.isEmpty ||
        newPasswordController.text.isEmpty ||
        newPasswordToConfirmController.text.isEmpty) {
      throw const FormatException('全ての項目を入力してください');
    }
    if (newPasswordController.text.trim() !=
        newPasswordToConfirmController.text.trim()) {
      throw const FormatException('新しいパスワードが一致していません');
    }
    //再認証
    await _userRepository.reAuthenticate(
        password: currentPasswordController.text.trim());
    //パスワード更新
    await _userRepository.updatePassword(
        newPassword: newPasswordController.text.trim());
  }
}

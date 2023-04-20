import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcards_mobile_app/repository/flashcard_repository.dart';
import 'package:flashcards_mobile_app/repository/user_provider.dart';
import 'package:flashcards_mobile_app/repository/user_repository.dart';
import 'package:flashcards_mobile_app/repository/word_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final deleteAccountProvider =
    StateNotifierProvider.autoDispose<DeleteAccountViewModel, void>(
        (ref) => DeleteAccountViewModel());

class DeleteAccountViewModel extends StateNotifier<void> {
  DeleteAccountViewModel() : super(null);

  final passwordController = TextEditingController();
  final _userRepository = UserRepository();
  final _wordRepository = WordRepository();
  final _flashcardRepository = FlashcardRepository();

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
  }

  ///
  /// メールアドレス変更のための再度ログイン用メソッド
  ///
  Future<void> reLogin() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        await _userRepository.logIn(
            email: user.email!, password: passwordController.text.trim());
      } on FirebaseAuthException catch (e) {
        print('reloginエラー');
        passwordController.clear();
        rethrow;
      }
    } else {
      throw '';
    }
  }

  ///
  /// アカウントを削除
  /// 単語群、単語帳、ユーザー情報、アカウントの順で削除
  ///
  Future<void> deleteAccount() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final uid = user.uid!;
      try {
        // wordを全て削除
        await _wordRepository.deleteAllByUID(uid: uid);
        // flashcardを全て削除
        await _flashcardRepository.deleteAllByUID(uid: uid);
        // user collection上のユーザ情報を削除
        await _userRepository.delete(uid: uid);
        // authのユーザ情報を削除
        await user.delete();
        // ログアウト
        await FirebaseAuth.instance.signOut();
      } on FirebaseAuthException catch (e) {
        print('delete account エラー');
        rethrow;
      }
    } else {
      throw '';
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart' as auth;
//import 'package:flashcards_mobile_app/domain/user.dart' as domain;
import 'package:flashcards_mobile_app/domain/user.dart';
import 'package:flashcards_mobile_app/presentation/login_and_register/login_and_register_state.dart';
import 'package:flashcards_mobile_app/repository/user_provider.dart';
import 'package:flashcards_mobile_app/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginAndRegisterProvider = StateNotifierProvider.autoDispose<
        LoginAndRegisterNotifier, LoginAndRegisterState>(
    (ref) => LoginAndRegisterNotifier(ref, LoginAndRegisterState()));

class LoginAndRegisterNotifier extends StateNotifier<LoginAndRegisterState> {
  LoginAndRegisterNotifier(this._ref, LoginAndRegisterState state)
      : super(state);
  final UserRepository _userRepository = UserRepository();
  final Ref _ref;

  ///
  /// ログインモードとアカウント登録モードをswitch
  ///
  void switchMode() {
    state = state.copyWith(isLoginMode: !state.isLoginMode);
  }

  ///
  /// アカウント登録。登録したUser情報をUserクラスの形でreturn
  ///
  Future<void> signUp({required String email, required String password}) async {
    if (email.isEmpty) {
      throw const FormatException('メールアドレスを入力してください');
    }
    if (password.isEmpty) {
      throw const FormatException('パスワードを入力してください');
    }

    try {
      final user = await _userRepository.add(email: email, password: password);
      // user providerにuser情報を渡す
      setUserToUserRepository(user);
    } catch (e) {
      print('signUp(): $e');
      rethrow;
    }
  }

  ///
  /// ログイン。ログインしたUser情報をUserクラスの形でreturn
  ///
  Future<void> login({required String email, required String password}) async {
    if (email.isEmpty) {
      throw const FormatException('メールアドレスを入力してください');
    }
    if (password.isEmpty) {
      throw const FormatException('パスワードを入力してください');
    }

    try {
      final user =
          await _userRepository.logIn(email: email, password: password);
      // user providerにuser情報を渡す
      setUserToUserRepository(user);
    } catch (e) {
      print('login(): $e');
      rethrow;
    }
  }

  ///
  /// user情報をuser providerに渡す
  ///
  void setUserToUserRepository(User user) {
    _ref.read(userProvider.notifier).setUser(user);
  }
}

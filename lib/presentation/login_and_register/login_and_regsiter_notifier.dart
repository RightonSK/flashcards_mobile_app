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

  // final controller = TextEditingController();
  //
  // @override
  // void dispose() {
  //   super.dispose();
  //   controller.dispose();
  // }

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
      throw ('メールアドレスを入力してください');
    }
    if (password.isEmpty) {
      throw ('パスワードを入力してください');
    }
    print('email: $email');
    print('password: $password');
    try {
      final user = await _userRepository.add(email: email, password: password);
      // user providerにuser情報を渡す
      setUserToUserRepository(user);
    } on auth.FirebaseAuthException catch (e) {
      print('sign up: ${e.code}');
      rethrow;
      //throw (_convertErrorMessageForSignup(e.code));
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
    } on auth.FirebaseAuthException catch (e) {
      print('login: ${e.code}');
      rethrow;
      //throw (_convertErrorMessageForLogin(e.code));
    }
  }

  Future<void> resetPassword() async {
    //final email =
  }

  ///
  /// user情報をuser providerに渡す
  ///
  void setUserToUserRepository(User user) {
    _ref.read(userProvider.notifier).setUser(user);
  }
}

// String _convertErrorMessageForLogin(String e) {
//   switch (e) {
//     case 'invalid-email':
//       return 'メールアドレスを正しい形式で入力してください';
//     case 'wrong-password':
//       return 'パスワードが間違っています';
//     case 'user-not-found':
//       return 'ユーザーが見つかりません';
//     case 'user-disabled':
//       return 'ユーザーが無効です';
//     case 'too-many-requests':
//       return 'しばらく待ってからお試し下さい';
//     default:
//       return '不明なエラーです';
//   }
// }
//
// String _convertErrorMessageForSignup(String e) {
//   switch (e) {
//     case 'invalid-email':
//       return 'メールアドレスを正しい形式で入力してください';
//     case 'email-already-in-use':
//       return '指定したメールアドレスは登録済みです';
//     case 'operation-not-allowed':
//       return '指定したメールアドレス・パスワードは現在使用できません';
//     case 'weak-password':
//       return 'パスワードは６文字以上にしてください';
//     default:
//       return '不明なエラーです';
//   }
// }

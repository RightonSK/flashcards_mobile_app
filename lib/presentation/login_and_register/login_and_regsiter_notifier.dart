import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flashcards_mobile_app/domain/user.dart' as domain;
import 'package:flashcards_mobile_app/presentation/login_and_register/login_and_register_state.dart';
import 'package:flashcards_mobile_app/repository/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginAndRegisterProvider =
    StateNotifierProvider<LoginAndRegisterNotifier, LoginAndRegisterState>(
        (ref) => LoginAndRegisterNotifier(LoginAndRegisterState()));

class LoginAndRegisterNotifier extends StateNotifier<LoginAndRegisterState> {
  LoginAndRegisterNotifier(LoginAndRegisterState state) : super(state);
  final UserRepository _userRepository = UserRepository();

  //　ログインモードとアカウント登録モードをswitch
  void switchMode() {
    state = state.copyWith(isLoginMode: !state.isLoginMode);
  }

  //　アカウント登録。登録したUser情報をUserクラスの形式でreturn
  Future<domain.User> signUp(
      {required String email, required String password}) async {
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
      return user;
    } on auth.FirebaseAuthException catch (e) {
      print('sign up: ${e.code}');
      rethrow;
      //throw (_convertErrorMessageForSignup(e.code));
    }
  }

  //　ログイン。ログインしたUser情報をUserクラスの形式でreturn
  Future<domain.User> login(
      {required String email, required String password}) async {
    if (email.isEmpty) {
      throw ('メールアドレスを入力してください');
    }
    if (password.isEmpty) {
      throw ('パスワードを入力してください');
    }

    try {
      final user =
          await _userRepository.logIn(email: email, password: password);
      return user;
    } on auth.FirebaseAuthException catch (e) {
      print('login: ${e.code}');
      rethrow;
      //throw (_convertErrorMessageForLogin(e.code));
    }
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

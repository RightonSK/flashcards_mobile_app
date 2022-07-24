import 'package:flashcards_mobile_app/presentation/login_and_register/login_and_register_state.dart';
import 'package:flashcards_mobile_app/repository/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginAndRegisterProvider =
    StateNotifierProvider<LoginAndRegisterNotifier, LoginAndRegisterState>(
        (ref) => LoginAndRegisterNotifier(LoginAndRegisterState()));

class LoginAndRegisterNotifier extends StateNotifier<LoginAndRegisterState> {
  LoginAndRegisterNotifier(LoginAndRegisterState state) : super(state);
  final UserRepository _userRepository = UserRepository();

  void switchMode() {
    state = state.copyWith(isLoginMode: !state.isLoginMode);
  }

  Future signUp({required String email, required String password}) async {
    //
    print('email: $email');
    print('password: $password');
    await _userRepository.add(email: email, password: password);
  }

  Future login({required String email, required String password}) async {
    //エラー処理を記述する
    //昔のsalon appを参考に？
    // login エラー処理 flutterで検索

    await _userRepository.logIn(email: email, password: password);
  }
}

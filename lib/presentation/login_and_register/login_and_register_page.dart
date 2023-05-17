import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flashcards_mobile_app/app_theme.dart';
import 'package:flashcards_mobile_app/presentation/login_and_register/forgot_password/forgot_password_page.dart';

//import 'package:flashcards_mobile_app/domain/user.dart' as domain;
import 'package:flashcards_mobile_app/presentation/login_and_register/login_and_regsiter_notifier.dart';
import 'package:flashcards_mobile_app/presentation/top/top_page.dart';
import 'package:flashcards_mobile_app/utils/convert_to_error_message_util.dart';
import 'package:flashcards_mobile_app/utils/navigation_util.dart';
import 'package:flashcards_mobile_app/utils/notification_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginAndRegisterPage extends HookConsumerWidget {
  const LoginAndRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginAndRegisterState = ref.watch(loginAndRegisterProvider);
    final loginAndRegisterNotifier =
        ref.watch(loginAndRegisterProvider.notifier);
    late final String _modeTitle;
    late final String _navigationText;
    late final String _navigationTitle;
    late final String _buttonTitle;
    final TextEditingController _emailController = useTextEditingController();
    final TextEditingController _passwordController =
        useTextEditingController();

    if (loginAndRegisterState.isLoginMode) {
      _modeTitle = 'ログイン';
      _navigationText = 'アカウントをお持ちでない方はこちら';
      _navigationTitle = 'アカウント登録';
      _buttonTitle = 'ログイン';
    } else {
      _modeTitle = 'アカウント登録';
      _navigationText = 'すでにアカウントをお持ちの方はこちら';
      _navigationTitle = 'ログイン';
      _buttonTitle = 'アカウント登録';
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ログイン　(テキスト)
              Text(
                _modeTitle,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),

              // アカウント登録 (テキスト)
              Row(
                children: [
                  Text(
                    _navigationText + ' ',
                    style: const TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  GestureDetector(
                    onTap: () {
                      loginAndRegisterNotifier.switchMode();
                    },
                    child: Text(
                      _navigationTitle,
                      style: const TextStyle(color: Colors.blue, fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              // email text field
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'メールアドレス',
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              // password text field
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'パスワード',
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              //　パスワードを忘れた方はこちら (テキスト)
              SizedBox(
                width: double.infinity,
                child: GestureDetector(
                  onTap: () async {
                    ///メールアドレス入力画面に遷移。
                    await NavigationUtil.pushPage(
                        context: context,
                        fullscreenDialog: true,
                        page: const ForgotPasswordPage());
                  },
                  child: const Text(
                    'パスワードを忘れた方はこちら',
                    style: TextStyle(color: Colors.blue),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              // ログインボタン
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    //ログインorアカウント登録
                    try {
                      if (loginAndRegisterState.isLoginMode) {
                        await loginAndRegisterNotifier.login(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim());
                      } else {
                        await loginAndRegisterNotifier.signUp(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim());
                      }
                      //成功後、top pageへ遷移
                      NavigationUtil.pushAndReplacePage(
                          context: context,
                          fullscreenDialog: false,
                          page: const TopPage());
                    } on auth.FirebaseAuthException catch (e) {
                      await NotificationUtil.showTextDialog(
                          context: context,
                          message:
                              ConvertToErrorMessageUtil.convertErrorMessage(
                                  e.code));
                    } on FormatException catch (e) {
                      NotificationUtil.showTextDialog(
                          context: context, message: e.message);
                    } catch (e) {
                      NotificationUtil.showTextSnackBar(
                          context: context,
                          message:
                              ConvertToErrorMessageUtil.convertErrorMessage(
                                  ''));
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _buttonTitle,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flashcards_mobile_app/presentation/login_and_register/login_and_regsiter_notifier.dart';
import 'package:flashcards_mobile_app/presentation/top/top_page.dart';
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),

              // アカウント登録 (テキスト)
              Row(
                children: [
                  Text(
                    _navigationText + ' ',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  GestureDetector(
                    onTap: () {
                      loginAndRegisterNotifier.switchMode();
                    },
                    child: Text(
                      _navigationTitle,
                      style: TextStyle(color: Colors.blue, fontSize: 14),
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
                decoration: InputDecoration(
                  labelText: 'メールアドレス',
                ),
              ),
              SizedBox(
                height: 10,
              ),

              // password text field
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'パスワード'),
              ),
              SizedBox(
                height: 10,
              ),

              //　パスワードを忘れた方はこちら (テキスト)
              const SizedBox(
                width: double.infinity,
                child: Text(
                  'パスワードを忘れた方はこちら',
                  style: TextStyle(color: Colors.blue),
                  textAlign: TextAlign.right,
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
                    if (loginAndRegisterState.isLoginMode) {
                      await loginAndRegisterNotifier.login(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim());
                    } else {
                      print('email: ${_emailController.text}');
                      print('password: ${_passwordController.text}');
                      await loginAndRegisterNotifier.signUp(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim());
                    }
                    //本来ならflashcardsを取得してtop pageへ遷移

                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const TopPage()));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      _buttonTitle,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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

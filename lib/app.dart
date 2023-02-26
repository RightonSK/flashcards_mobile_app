import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcards_mobile_app/app_theme.dart';
import 'package:flashcards_mobile_app/repository/user_provider.dart';
import 'package:flashcards_mobile_app/app_notifier.dart';
import 'package:flashcards_mobile_app/presentation/login_and_register/login_and_register_page.dart';
import 'package:flashcards_mobile_app/presentation/top/top_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(appProvider); //初期化用
    final user = ref.watch(userProvider);
    final userAuth = FirebaseAuth.instance.currentUser;

    return MaterialApp(
      theme: theme,
      routes: {
        '/login': (context) => const LoginAndRegisterPage(),
        '/top': (context) => const TopPage(),
      },
      home: () {
        /// ログインされていない状態、LoginAndRegisterPageに遷移。
        /// ログインされている状態、user providerにユーザー情報を渡した後、
        /// top pgaeに遷移
        if (userAuth != null) {
          if (user != null) {
            FlutterNativeSplash.remove();
            return const TopPage();
          } else {
            return const Scaffold();
          }
        } else {
          FlutterNativeSplash.remove();
          return const LoginAndRegisterPage();
        }
      }(),
    );
  }
}

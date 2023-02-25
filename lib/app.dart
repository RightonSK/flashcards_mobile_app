import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcards_mobile_app/app_model.dart';
import 'package:flashcards_mobile_app/presentation/login_and_register/login_and_register_page.dart';
import 'package:flashcards_mobile_app/presentation/top/top_notifier.dart';
import 'package:flashcards_mobile_app/presentation/top/top_page.dart';
import 'package:flashcards_mobile_app/utils/convert_to_user_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAuth = FirebaseAuth.instance.currentUser;
    // ログイン状態なら、ユーザ情報とデータ取得
    if (userAuth != null) {
      Future(() async {
        final user = await ConvertToUserUtil.convertUserFirebaseAuthToUser(
            userAuth: userAuth);
        ref.read(userProvider.notifier).setUser(user);
        await ref.read(topProvider.notifier).fetchFlashcards();
        FlutterNativeSplash.remove();
      });
    }

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey.shade200,
        // appBarTheme: AppBarTheme(
        //   titleTextStyle: TextStyle(
        //     fontWeight: FontWeight.bold,
        //     fontSize: 20,
        //   ),
        // ),
        // cardTheme: CardTheme(
        //   shape:
        //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        // ),
      ),
      routes: {
        '/login': (context) => const LoginAndRegisterPage(),
        '/top': (context) => const TopPage(),
      },
      home: () {
        if (userAuth != null) {
          //ログイン状態なら、top pageを表示
          return const TopPage();
        } else {
          //非ログイン状態なら、login pageを表示
          FlutterNativeSplash.remove();
          return const LoginAndRegisterPage();
        }
      }(),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flashcards_mobile_app/presentation/top/top_notifier.dart';
import 'package:flashcards_mobile_app/presentation/top/top_page.dart';
import 'package:flashcards_mobile_app/splash_screen/splash_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // initialize(DBからデータ取得)
    Future(() async {
      await ref.read(topProvider.notifier).fetchFlashcardList();
      FlutterNativeSplash.remove();
    });
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TopPage(),
    );
  }
}
//
// class MyApp2 extends StatelessWidget {
//   const MyApp2({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const TopPage(),
//     );
//   }
// }

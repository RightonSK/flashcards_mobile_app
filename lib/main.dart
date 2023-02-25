import 'package:firebase_core/firebase_core.dart';
import 'package:flashcards_mobile_app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: App()));
}

// class MyApp extends ConsumerWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // initialize(DBからデータ取得)
//     Future(() async {
//       await ref.read(topProvider.notifier).fetchFlashcards();
//       FlutterNativeSplash.remove();
//     });
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const LoginAndRegisterPage(),
//     );
//   }
// }

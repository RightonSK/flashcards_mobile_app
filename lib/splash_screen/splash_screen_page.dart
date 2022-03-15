import 'package:flashcards_mobile_app/presentation/top/top_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreenPage extends ConsumerStatefulWidget {
  @override
  _SplashScreenPage createState() => _SplashScreenPage();
}

class _SplashScreenPage extends ConsumerState<SplashScreenPage> {
  @override
  void initState() {
    Future(() async {
      await Future.delayed(Duration(seconds: 5));
      await ref.read(topProvider.notifier).fetchFlashcardList();
    });
    print('init 終了');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 50,
          height: 50,
          color: Colors.black,
        ),
      ),
    );
  }
}

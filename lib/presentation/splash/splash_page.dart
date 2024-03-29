import 'package:flutter/material.dart';

/// スプラッシュ画面
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            child: Container()
          ),
        ),
      ),
    );
  }
}

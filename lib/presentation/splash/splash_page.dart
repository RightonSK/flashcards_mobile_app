import 'package:flutter/material.dart';

/// スプラッシュ画面
class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 96,
                  child: Image.asset('assets/flutter-logo.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

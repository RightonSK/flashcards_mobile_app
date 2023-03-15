import 'package:flutter/material.dart';

final theme = ThemeData(
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: const Color(0xFFF0F5F9),
  // appBarTheme: AppBarTheme(
  //   titleTextStyle: TextStyle(
  //     fontWeight: FontWeight.bold,
  //     fontSize: 20,
  //   ),
  // ),
  appBarTheme: const AppBarTheme(
      color: Color(0xFFC9D6DF), foregroundColor: Colors.black),
  cardTheme: const CardTheme(
      //color: Color(0xFFC9D6DF),
      ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF52616B),
    foregroundColor: Colors.white,
  ),
);

class AppColor {
  AppColor._();
  static final Color colorDefaultOfStatusBar = theme.scaffoldBackgroundColor;
  static const Color colorActionModeOfStatusBar = Color(0xFF52616B);
  static const Color colorBackgroundOfContextualActionBar = Color(0xFF52616B);
  static const Color colorForegroundOfContextualActionBar = Colors.white;

  // static const Color colorOfActionModeOfStatusBar = Colors.indigoAccent;
  // static const Color colorOfContextualActionBar = Colors.indigoAccent;
}

/// colored status barの色もthemeで決めたい。
/// widgetだからグローバル変数に色設定したcolored status barを返して使う？
/// themeで色のプロパティが複数あるならそれを使いたい。

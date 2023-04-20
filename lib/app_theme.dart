import 'package:flutter/material.dart';

final theme = ThemeData(
  primarySwatch: Colors.blue,
  //primarySwatch: Colors.black,
  scaffoldBackgroundColor: const Color(0xFFF0F5F9),
  appBarTheme: const AppBarTheme(
      color: Color(0xFFC9D6DF), foregroundColor: Colors.black),
  // cardTheme: const CardTheme(
  //   elevation: 2.0,
  // ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColor.accentColor,
    foregroundColor: Colors.white,
  ),
);

class TextThemeSettings {
  TextThemeSettings._();
  static final TextStyle titleOfFlashcard =
      TextStyle(fontSize: 16, letterSpacing: 1.0);
}

class AppColor {
  AppColor._();
  static const Color baseColor = Color(0xFFF0F5F9);
  static const Color mainColor = Color(0xFFC9D6DF);
  static const Color accentColor = Color(0xFF52616B);

  static final Color colorDefaultOfStatusBar = theme.scaffoldBackgroundColor;
  static const Color colorActionModeOfStatusBar = Color(0xFF52616B);
  static const Color colorBackgroundOfContextualActionBar = Color(0xFF52616B);
  static const Color colorForegroundOfContextualActionBar = Colors.white;
  static const Color backgroundColorOfButton = mainColor;
  static const Color foregroundColorOfButton = Colors.black;

  // static const Color colorOfActionModeOfStatusBar = Colors.indigoAccent;
  // static const Color colorOfContextualActionBar = Colors.indigoAccent;
}

/// colored status barの色もthemeで決めたい。
/// widgetだからグローバル変数に色設定したcolored status barを返して使う？
/// themeで色のプロパティが複数あるならそれを使いたい。

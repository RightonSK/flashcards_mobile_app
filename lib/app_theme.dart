import 'package:flutter/material.dart';

final theme = ThemeData(
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.grey.shade200,
  // appBarTheme: AppBarTheme(
  //   titleTextStyle: TextStyle(
  //     fontWeight: FontWeight.bold,
  //     fontSize: 20,
  //   ),
  // ),

  // cardTheme: CardTheme(
  //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  // ),
);

class AppColor {
  AppColor._();
  static final Color colorOfDefaultOfStatusBar = theme.scaffoldBackgroundColor;
  static const Color colorOfActionModeOfStatusBar = Colors.indigoAccent;
  static const Color colorOfContextualActionBar = Colors.indigoAccent;
}

/// colored status barの色もthemeで決めたい。
/// widgetだからグローバル変数に色設定したcolored status barを返して使う？
/// themeで色のプロパティが複数あるならそれを使いたい。

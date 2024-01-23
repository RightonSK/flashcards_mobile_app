import 'package:flutter/material.dart';

const Color _baseColor = Color(0xFFF0F5F9);
const Color _mainColor = Color(0xFFC9D6DF);
const Color _accentColor = Color(0xFF52616B);

final theme = ThemeData(
  scaffoldBackgroundColor: _baseColor,
  colorScheme: const ColorScheme.light(
    primary: _mainColor,
    onPrimary: Colors.black,
    secondary: _accentColor,
    onSecondary: Colors.white,
  ),

  // cardTheme: const CardTheme(
  //   elevation: 2.0,
  // ),
);

class TextThemeSettings {
  TextThemeSettings._();
  // Flashcardのtext style
  static final TextStyle titleOfFlashcard =
      TextStyle(fontSize: 16, letterSpacing: 1.0);
  // Wordのtext style
  static final TextStyle titleOfWord =
      TextStyle(fontSize: 14, letterSpacing: 1.0);
}

class AppColor {
  AppColor._();
  static const Color colorBackground = _baseColor;
  static final Color colorDefaultOfStatusBar = theme.scaffoldBackgroundColor;
  static const Color colorActionModeOfStatusBar = _accentColor;
  static const Color colorBackgroundOfContextualActionBar = _accentColor;
  static const Color colorForegroundOfContextualActionBar = Colors.white;
  static const Color backgroundColorOfButton = _mainColor;
  static const Color foregroundColorOfButton = Colors.black;
  static const Color colorBorderOfSelectedCard = _accentColor;
  static const Color backgroundColorOfTutorial = _accentColor;
}

/// Flutter側の設定：
///
/// ElevatedButton
/// backgroundColor: colorScheme.primary,
/// foregroundColor: colorScheme.onPrimary,
///
///
///

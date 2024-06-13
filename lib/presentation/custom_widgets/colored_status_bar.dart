import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///
/// Action Modeの時、ダークモード同様status barは黒くなるので、Brightness.dark
/// 通常時は、ライトモード同様status barは白いので、Brightness.light
///

class ColoredStatusBar extends StatelessWidget {
  const ColoredStatusBar({
    Key? key,
    required this.color,
    required this.child,
    required this.brightness, //for android
  }) : super(key: key);

  final Color color;
  final Widget child;
  final Brightness brightness;

  @override
  Widget build(BuildContext context) {
    // final iosBrightnessForIcons =
    //     brightness == Brightness.light ? Brightness.dark : Brightness.light;
    final androidBrightnessForIcons = brightness == Brightness.light ? Brightness.dark : Brightness.light;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: color,
        statusBarIconBrightness: androidBrightnessForIcons, // brightness for android
        statusBarBrightness: brightness, // brightness for ios
      ),
      child: Container(
        color: color,
        child: SafeArea(
          bottom: false,
          right: false,
          left: false,
          child: Container(
            child: child,
          ),
        ),
      ),
    );
  }
}

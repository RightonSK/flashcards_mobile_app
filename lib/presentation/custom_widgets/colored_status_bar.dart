import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColoredStatusBar extends StatelessWidget {
  const ColoredStatusBar({
    Key? key,
    required this.color,
    required this.child,
    this.brightness = Brightness.light, //for android
  }) : super(key: key);

  final Color color;
  final Widget child;
  final Brightness brightness;

  @override
  Widget build(BuildContext context) {
    final iosBrightnessForIcons =
        brightness == Brightness.light ? Brightness.dark : Brightness.light;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: color,
        statusBarIconBrightness: brightness, // brightness for android
        statusBarBrightness: iosBrightnessForIcons, // brightness for ios
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

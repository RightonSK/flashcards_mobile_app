import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationUtil {
  NavigationUtil._();

  static Future<void> pushPage(
      {required BuildContext context,
      required bool fullscreenDialog,
      required Widget page}) async {
    await Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => page,
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }

  static Future<void> pushAndReplacePage(
      {required BuildContext context,
      required bool fullscreenDialog,
      required Widget page}) async {
    await Navigator.of(context).pushReplacement(
      CupertinoPageRoute(
        builder: (context) => page,
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }
}

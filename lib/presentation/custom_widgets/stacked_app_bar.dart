import 'package:flutter/material.dart';

///
/// stacked状態に移行する時、次の状態遷移を行う。
/// 1. default app barのみ
/// 2. default app barの上にcontextual action barがexistする状態
/// 3. default app barの上にcontextual action barがexistし、かつvisibleの状態
///
///
class StackedAppBar extends StatefulWidget {
  const StackedAppBar(
      {required this.defaultAppBar,
      required this.contextualActionBar,
      required this.isStacked,
      required this.child,
      Key? key})
      : super(key: key);
  final bool isStacked;
  final AppBar defaultAppBar;
  final AppBar contextualActionBar;
  final Widget child;

  @override
  _StackedAppBarState createState() => _StackedAppBarState();
}

class _StackedAppBarState extends State<StackedAppBar> {
  late bool contextualActionBarExists;
  late bool isVisibleContextualActionBar;

  @override
  void initState() {
    super.initState();
    contextualActionBarExists = widget.isStacked; // false
    isVisibleContextualActionBar = widget.isStacked; //false
  }

  @override
  void didUpdateWidget(covariant StackedAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isStacked) contextualActionBarExists = true;
    if (!widget.isStacked) isVisibleContextualActionBar = false;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (isVisibleContextualActionBar == false &&
          contextualActionBarExists == true) {
        if (widget.isStacked) {
          //可視化処理時
          setState(() {
            isVisibleContextualActionBar = true;
          });
        } else {
          //不可視化処理時
          // アニメーション効果終了のための待ち時間
          await Future.delayed(const Duration(milliseconds: 500));
          setState(() {
            contextualActionBarExists = false;
          });
        }
      }
    });

    return getAppBar();
  }

  // app barを返すメソッド
  Widget getAppBar() {
    return Column(
      children: [
        Stack(
          children: [
            widget.defaultAppBar,
            // contextualActionBarExistsがtrueの時のみ表示
            if (contextualActionBarExists)
              AnimatedOpacity(
                  duration: isVisibleContextualActionBar
                      ? const Duration(milliseconds: 500) //可視化の時間
                      : const Duration(milliseconds: 500), //不可視かの時間
                  opacity: isVisibleContextualActionBar ? 1.0 : 0.0,
                  curve: isVisibleContextualActionBar
                      ? Curves.easeIn
                      : Curves.easeIn,
                  child: widget.contextualActionBar),
          ],
        ),
        widget.child,
      ],
    );
  }
}

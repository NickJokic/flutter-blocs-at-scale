import 'package:flutter/material.dart';

const Duration _kAnimationDuration = Duration(milliseconds: 300);

class CustomFadeAnimatedSwitcher extends StatelessWidget {
  final Widget child;

  const CustomFadeAnimatedSwitcher({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: _kAnimationDuration,
      transitionBuilder: (Widget child, Animation<double> animation) =>
          FadeTransition(child: child, opacity: animation),
      child: child,
    );
  }
}

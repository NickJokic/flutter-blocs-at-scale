import 'package:flutter/material.dart';

const Size _kDefaultSize = Size(320, 44);
const Color _kDefaultBgColor = Colors.deepOrange;
const double _kDefaultBorderRadius = 24;

/// Reusable widget that extends [ElevatedButton] with predefined properties.
class CustomElevatedButton extends ElevatedButton {
  @override
  final Widget child;

  @override
  final void Function() onPressed;
  final Size size;
  final Color bgColor;
  final double borderRadius;

  CustomElevatedButton({
    required this.child,
    required this.onPressed,
    this.size = _kDefaultSize,
    this.bgColor = _kDefaultBgColor,
    this.borderRadius = _kDefaultBorderRadius,
    Key? key,
  }) : super(
          key: key,
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(size),
            backgroundColor: MaterialStateProperty.all(bgColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
          ),
          onPressed: onPressed,
          child: child,
        );
}

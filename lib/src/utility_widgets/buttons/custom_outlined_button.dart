import 'package:blocs_at_scale/src/config/theme/index.dart';
import 'package:flutter/material.dart';

const Size _kDefaultSize = Size(320, 54);
const Color _kDefaultBgColor = Colors.transparent;
const Color _kDefaultBorderColor = AppColors.neutral1;
const double _kDefaultBorderRadius = 24;

/// Reusable widget that extends [ElevatedButton] with predefined properties.
class CustomOutlinedButton extends ElevatedButton {
  @override
  final Widget child;

  @override
  final void Function() onPressed;
  final Size size;
  final Color borderColor;
  final double borderRadius;

  CustomOutlinedButton({
    required this.child,
    required this.onPressed,
    this.size = _kDefaultSize,
    this.borderColor = _kDefaultBorderColor,
    this.borderRadius = _kDefaultBorderRadius,
    Key? key,
  }) : super(
          key: key,
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            fixedSize: MaterialStateProperty.all(size),
            backgroundColor: MaterialStateProperty.all(_kDefaultBgColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: BorderSide(width: 2, color: borderColor),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
          ),
          onPressed: onPressed,
          child: child,
        );
}

import 'package:blocs_at_scale/src/config/theme/app_colors.dart';
import 'package:blocs_at_scale/src/config/theme/app_constants.dart';
import 'package:blocs_at_scale/src/utility_widgets/animated/tappable_auto_scale_wrapper.dart';
import 'package:flutter/material.dart';

class ClickableCard extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final Function? onTapDown;
  final Color? backgroundColor;
  final double? elevation;
  final bool? enableScaleTransitionOnTap;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;

  const ClickableCard({
    required this.child,
    required this.onTap,
    this.onTapDown,
    this.backgroundColor = AppColors.neutral2,
    this.elevation = 4,
    this.enableScaleTransitionOnTap = true,
    this.borderRadius,
    this.borderSide,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (enableScaleTransitionOnTap == true) {
      return TappableAutoScaleWrapper(
        onTap: onTap,
        beginTween: 1.0,
        endTween: 0.96,
        child: Card(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(AppConstants.kCardBorderRadiusMedium),
            side: borderSide ?? const BorderSide(style: BorderStyle.none),
          ),
          elevation: elevation,
          color: backgroundColor,
          child: child,
        ),
      );
    } else {
      return GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: Card(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(AppConstants.kCardBorderRadiusMedium),
            side: borderSide ?? const BorderSide(style: BorderStyle.none),
          ),
          elevation: elevation,
          color: backgroundColor,
          child: child,
        ),
      );
    }
  }
}

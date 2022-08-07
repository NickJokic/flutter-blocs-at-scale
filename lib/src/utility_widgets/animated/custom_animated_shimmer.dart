import 'package:blocs_at_scale/src/config/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

const Duration _kSwitchAnimationDuration = Duration(milliseconds: 750);
const Color _kBaseColorDark = AppColors.neutral3;
const Color _kHighlightColorDark = AppColors.neutral4;
const Color _kBaseColorLight = AppColors.neutral5;
const Color _kHighlightColorLight = AppColors.neutral4;

class CustomAnimatedShimmer extends StatelessWidget {
  final Widget child;
  final bool enabled;
  final bool darkMode;

  const CustomAnimatedShimmer({
    required this.child,
    this.darkMode = false,
    this.enabled = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: _kSwitchAnimationDuration,
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeOutCubic,
      child: !enabled
          ? child
          : Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              period: const Duration(seconds: 2),
              baseColor: darkMode ? _kBaseColorDark : _kBaseColorLight,
              highlightColor: darkMode ? _kHighlightColorDark : _kHighlightColorLight,
              child: child,
            ),
    );
  }
}

import 'package:blocs_at_scale/src/config/theme/app_colors.dart';
import 'package:blocs_at_scale/src/config/theme/app_constants.dart';
import 'package:flutter/material.dart';

class PresentationalCard extends Card {
  PresentationalCard({
    required Widget child,
    Color? backgroundColor,
    ShapeBorder? shape,
    double? elevation,
    EdgeInsets margin = const EdgeInsets.only(bottom: 24.0),
    Key? key,
  }) : super(
          key: key,
          clipBehavior: Clip.antiAlias,
          margin: margin,
          elevation: elevation ?? 0,
          shape: shape ??
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppConstants.kCardBorderRadiusMedium), side: BorderSide.none),
          color: backgroundColor ?? AppColors.neutral2,
          child: child,
        );
}

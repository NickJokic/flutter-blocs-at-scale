import 'package:blocs_at_scale/src/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

const String kFontFamily = 'Montserrat';

class AppTextStyles {
  // Headings
  static const TextStyle h1 = TextStyle(
    fontFamily: kFontFamily,
    color: AppColors.neutral1,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.28,
    height: 1.3,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: kFontFamily,
    color: AppColors.neutral1,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.24,
    height: 1.3,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: kFontFamily,
    color: AppColors.neutral1,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.2,
    height: 1.3,
  );

  static const TextStyle h4 = TextStyle(
    fontFamily: kFontFamily,
    color: AppColors.neutral1,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.18,
    height: 1.3,
  );

  // Subheadings
  static const TextStyle sh1 = TextStyle(
    fontFamily: kFontFamily,
    color: AppColors.neutral4,
    fontSize: 24,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.24,
    height: 1.3,
  );

  static const TextStyle sh2 = TextStyle(
    fontFamily: kFontFamily,
    color: AppColors.neutral4,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.18,
    height: 1.3,
  );

  static const TextStyle sh3 = TextStyle(
    fontFamily: kFontFamily,
    color: AppColors.neutral4,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.16,
    height: 1,
  );

  // Body
  static const TextStyle body = TextStyle(
    fontFamily: kFontFamily,
    color: AppColors.neutral1,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.48,
    height: 1.65,
  );

  // Buttons
  static const TextStyle button = TextStyle(
    fontFamily: kFontFamily,
    color: AppColors.neutral1,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.16,
    height: 1.3,
  );

  static const TextStyle button2 = TextStyle(
    fontFamily: kFontFamily,
    color: AppColors.neutral1,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 2.56,
    height: 1.3,
  );

  // Captions
  static const TextStyle caption1 = TextStyle(
    fontFamily: kFontFamily,
    color: AppColors.neutral4,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.48,
    height: 1.3,
  );

  static const TextStyle caption2 = TextStyle(
    fontFamily: kFontFamily,
    color: AppColors.neutral4,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.14,
    height: 1.3,
  );

  static const TextStyle caption3 = TextStyle(
    fontFamily: kFontFamily,
    color: AppColors.neutral4,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.12,
    height: 1.3,
  );
}

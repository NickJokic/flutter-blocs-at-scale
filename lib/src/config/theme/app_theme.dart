import 'package:blocs_at_scale/src/config/theme/app_colors.dart';
import 'package:blocs_at_scale/src/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  final ThemeData lightTheme = ThemeData(
    fontFamily: kFontFamily,
    backgroundColor: AppColors.neutral0,
    scaffoldBackgroundColor: AppColors.neutral0,
    primaryColor: AppColors.primary0,
    canvasColor: Colors.transparent,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      },
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.neutral0,
      iconTheme: IconThemeData(
        color: AppColors.neutral1,
      ),
    ),
  );
}

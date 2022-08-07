import 'dart:ui';

import 'package:blocs_at_scale/src/config/theme/index.dart';
import 'package:blocs_at_scale/src/utility_widgets/animated/custom_fade_animated_switcher.dart';
import 'package:flutter/material.dart';

class CheckoutTotalPriceRow extends StatelessWidget {
  final String price;

  const CheckoutTotalPriceRow({
    required this.price,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Container(
        color: AppColors.neutral0.withOpacity(0.9),
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.kAppMargin, vertical: 16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('TOTAL', style: AppTextStyles.h1),
              CustomFadeAnimatedSwitcher(
                child: Text(
                  price,
                  style: AppTextStyles.h1,
                  key: UniqueKey(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

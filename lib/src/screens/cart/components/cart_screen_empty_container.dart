import 'package:blocs_at_scale/src/config/routing/app_route_name.dart';
import 'package:blocs_at_scale/src/config/theme/index.dart';
import 'package:blocs_at_scale/src/utility_widgets/buttons/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreenEmptyContainer extends StatelessWidget {
  const CartScreenEmptyContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 164,
            width: 164,
            decoration: const BoxDecoration(
              color: AppColors.neutral2,
              shape: BoxShape.circle,
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: SvgPicture.asset(AppImages.iconCartEmpty, height: 96, width: 96),
            ),
          ),
          const SizedBox(height: 32),
          const Text('Your cart is empty', style: AppTextStyles.h3),
          const SizedBox(height: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: Text(
              'Looks like you haven’t made up your mind yet.  Take your time.',
              style: AppTextStyles.body.copyWith(color: AppColors.neutral4),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 54),
          CustomOutlinedButton(
            child: const Text('SHOP PRODUCTS', style: AppTextStyles.button2),
            onPressed: () => Navigator.of(context).popUntil((route) => route.settings.name == AppRouteName.home),
          ),
        ],
      ),
    );
  }
}

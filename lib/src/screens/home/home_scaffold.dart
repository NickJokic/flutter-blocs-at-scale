import 'package:blocs_at_scale/src/config/routing/app_route_name.dart';
import 'package:blocs_at_scale/src/config/theme/app_colors.dart';
import 'package:blocs_at_scale/src/config/theme/app_images.dart';
import 'package:blocs_at_scale/src/screens/widgets/cart_cta_button/cart_cta_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScaffold extends StatelessWidget {
  final Widget child;
  final void Function() onCartCTAPressed;

  const HomeScaffold({required this.child, required this.onCartCTAPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral0,
      bottomNavigationBar: CartCTAButton(onTap: onCartCTAPressed),
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.neutral0,
        leadingWidth: double.infinity,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: SvgPicture.asset(AppImages.logoWh, fit: BoxFit.contain),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              alignment: Alignment.center,
              icon: SvgPicture.asset(AppImages.iconCart, height: 28),
              splashRadius: 24,
              onPressed: () => Navigator.of(context).pushNamed(AppRouteName.cart),
            ),
          ),
        ],
      ),
      body: child,
    );
  }
}

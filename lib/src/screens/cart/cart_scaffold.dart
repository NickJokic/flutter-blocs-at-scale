import 'package:blocs_at_scale/src/config/theme/index.dart';
import 'package:blocs_at_scale/src/screens/cart/components/checkout_cta_button.dart';
import 'package:flutter/material.dart';

class CartScaffold extends StatelessWidget {
  final Widget child;
  final void Function() onCheckoutCTAPressed;

  const CartScaffold({required this.child, required this.onCheckoutCTAPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral0,
      extendBody: true,
      bottomNavigationBar: CheckoutCTAButton(onTap: onCheckoutCTAPressed),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Your cart', style: AppTextStyles.h2),
        centerTitle: false,
      ),
      body: child,
    );
  }
}

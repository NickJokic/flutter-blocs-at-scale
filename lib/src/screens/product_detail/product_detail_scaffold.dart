import 'package:blocs_at_scale/src/config/theme/index.dart';
import 'package:blocs_at_scale/src/screens/widgets/cart_cta_button/cart_cta_button.dart';
import 'package:flutter/material.dart';

class ProductDetailScaffold extends StatelessWidget {
  final Widget child;
  final void Function() onCartCTAPressed;

  const ProductDetailScaffold({required this.child, required this.onCartCTAPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.neutral0,
      bottomNavigationBar: CartCTAButton(onTap: onCartCTAPressed),
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: child,
    );
  }
}

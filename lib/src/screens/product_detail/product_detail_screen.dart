import 'package:blocs_at_scale/src/blocs/index.dart';
import 'package:blocs_at_scale/src/config/routing/app_route_name.dart';
import 'package:blocs_at_scale/src/config/theme/index.dart';
import 'package:blocs_at_scale/src/models/product_model.dart';
import 'package:blocs_at_scale/src/screens/product_detail/product_detail_scaffold.dart';
import 'package:blocs_at_scale/src/screens/widgets/product_quantity_control/product_quantity_control.dart';
import 'package:blocs_at_scale/src/services/format_helper.dart';
import 'package:blocs_at_scale/src/utility_widgets/misc/bottom_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({required this.product, Key? key}) : super(key: key);

  void _onCartCTAPressed(BuildContext context) => Navigator.of(context).pushNamed(AppRouteName.cart);

  @override
  Widget build(BuildContext context) {
    return ProductDetailScaffold(
      onCartCTAPressed: () => _onCartCTAPressed(context),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Hero Image
            Container(
              height: MediaQuery.of(context).size.height * 0.385,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.neutral2,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(36), bottomRight: Radius.circular(36)),
              ),
              child: Hero(
                tag: 'hero-product-${product.id}',
                child: Center(
                  child: Image.asset(
                    product.assetImagePath,
                    height: MediaQuery.of(context).size.height * 0.27,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Product Info
            BlocBuilder<CartBloc, CartState>(
              builder: (context, cartState) {
                final int _productQuantity =
                    cartState is CartInitialized ? cartState.storage.getProductQuantity(product.id) : 0;
                final String _productWeight = context.read<FormatHelper>().formatWeightKgToGString(product.weightKg);
                final String _productPrice = context.read<FormatHelper>().formatPriceToString(product.price);

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppConstants.kAppMargin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.manufacturer.toUpperCase(), style: AppTextStyles.h1),
                      Text(product.name, style: AppTextStyles.sh1),
                      const SizedBox(height: 16),
                      Text(_productWeight, style: AppTextStyles.caption1),
                      const SizedBox(height: 36),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProductQuantityControl(
                            quantity: _productQuantity,
                            autoCollapse: false,
                            onIncrement: () => context.read<CartBloc>().add(AddToCart(product: product)),
                            onDecrement: () => context.read<CartBloc>().add(RemoveFromCart(product: product)),
                          ),
                          Text(_productPrice, style: AppTextStyles.h2),
                        ],
                      ),
                      const SizedBox(height: 52),
                      const Text('About this product', style: AppTextStyles.h3),
                      const SizedBox(height: 16),
                      Text(product.description, style: AppTextStyles.body),
                    ],
                  ),
                );
              },
            ),
            const BottomSpacer(),
          ],
        ),
      ),
    );
  }
}

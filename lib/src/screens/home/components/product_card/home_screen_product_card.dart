import 'package:blocs_at_scale/src/blocs/index.dart';
import 'package:blocs_at_scale/src/config/routing/app_route_name.dart';
import 'package:blocs_at_scale/src/config/theme/index.dart';
import 'package:blocs_at_scale/src/models/product_model.dart';
import 'package:blocs_at_scale/src/screens/widgets/product_quantity_control/product_quantity_control.dart';
import 'package:blocs_at_scale/src/utility_widgets/animated/custom_animated_shimmer.dart';
import 'package:blocs_at_scale/src/utility_widgets/cards/clickable_card.dart';
import 'package:blocs_at_scale/src/utility_widgets/misc/measure_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const double _kCardAspectRatio = 0.7148;
const double _kInitialCardHeight = 256;

class HomeScreenProductCard extends StatefulWidget {
  final Product? product;
  final int quantity;
  final int index;

  const HomeScreenProductCard({
    required this.product,
    required this.quantity,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreenProductCard> createState() => _HomeScreenProductCardState();
}

class _HomeScreenProductCardState extends State<HomeScreenProductCard> {
  double _productCardHeight = _kInitialCardHeight;

  @override
  Widget build(BuildContext context) {
    final bool _isProductLoaded = widget.product != null;

    return CustomAnimatedShimmer(
      darkMode: true,
      enabled: !_isProductLoaded,
      child: Padding(
        padding: const EdgeInsets.all(0).copyWith(top: widget.index == 1 ? 46 : 0), // Adds padding to the right column
        child: SizedBox(
          height: _productCardHeight + kProductQuantityControlSize / 2,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: MeasureSize(
                  onChange: (size) => setState(() => _productCardHeight = size.height),
                  child: AspectRatio(
                    aspectRatio: _kCardAspectRatio,
                    child: ClickableCard(
                      child: Padding(
                        padding: const EdgeInsets.all(AppConstants.kAppMargin),
                        child: _isProductLoaded
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Product Image
                                  Hero(
                                    tag: 'hero-product-${widget.product?.id}',
                                    child: Image.asset(
                                      widget.product?.assetImagePath ?? '',
                                      width: double.infinity,
                                    ),
                                  ),
                                  const SizedBox(height: 8),

                                  // Product manufacturer + product name
                                  Text(widget.product?.manufacturer ?? '', style: AppTextStyles.h4),
                                  Text(widget.product?.name ?? '', style: AppTextStyles.sh3),
                                ],
                              )
                            : const SizedBox.shrink(),
                      ),
                      onTap: widget.product != null
                          ? () => Navigator.of(context).pushNamed(
                                AppRouteName.productDetail,
                                arguments: widget.product,
                              )
                          : null,
                    ),
                  ),
                ),
              ),
              // Quantity Control
              Visibility(
                visible: _isProductLoaded,
                child: Positioned(
                  bottom: 0,
                  child: ProductQuantityControl(
                    quantity: widget.quantity,
                    onIncrement: () => context.read<CartBloc>().add(AddToCart(product: widget.product!)),
                    onDecrement: () => context.read<CartBloc>().add(RemoveFromCart(product: widget.product!)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

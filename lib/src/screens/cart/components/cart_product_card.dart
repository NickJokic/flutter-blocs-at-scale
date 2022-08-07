import 'package:blocs_at_scale/src/blocs/index.dart';
import 'package:blocs_at_scale/src/config/theme/index.dart';
import 'package:blocs_at_scale/src/models/product_model.dart';
import 'package:blocs_at_scale/src/screens/widgets/product_quantity_control/product_quantity_control.dart';
import 'package:blocs_at_scale/src/services/format_helper.dart';
import 'package:blocs_at_scale/src/utility_widgets/cards/presentational_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  final void Function()? onRemove;

  const CartProductCard({
    required this.product,
    required this.quantity,
    this.onRemove,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _formattedPrice = context.read<FormatHelper>().formatPriceToString(product.price);

    return PresentationalCard(
      child: Container(
        constraints: const BoxConstraints(minHeight: 100),
        padding: const EdgeInsets.all(AppConstants.kAppMargin),
        child: Row(
          children: [
            Image.asset(AppImages.testProduct, height: 86),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.manufacturer, style: AppTextStyles.h4),
                Text(product.name, style: AppTextStyles.caption2),
                const SizedBox(height: 3),
                Text('$_formattedPrice / pc', style: AppTextStyles.caption3),
              ],
            ),
            const Spacer(),
            ProductQuantityControl(
              quantity: quantity,
              autoCollapse: false,
              onIncrement: () => context.read<CartBloc>().add(AddToCart(product: product)),
              onDecrement: () async {
                final _cartBloc = context.read<CartBloc>();
                final bool _shouldRemoveTotally =
                    (_cartBloc.state as CartInitialized).storage.getProductQuantity(product.id) == 1;

                if (_shouldRemoveTotally && onRemove != null) {
                  onRemove!();
                  await Future.delayed(const Duration(milliseconds: 300));
                }
                _cartBloc.add(RemoveFromCart(product: product));
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:blocs_at_scale/src/blocs/index.dart';
import 'package:blocs_at_scale/src/screens/cart/cart_scaffold.dart';
import 'package:blocs_at_scale/src/screens/cart/components/cart_screen_empty_container.dart';
import 'package:blocs_at_scale/src/screens/cart/components/cart_screen_products_container.dart';
import 'package:blocs_at_scale/src/utility_widgets/animated/custom_fade_animated_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  void _onCheckoutCTAPressed(BuildContext context) => showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          content: Text('Can\'t checkout. It\'s only a demo.'),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return CartScaffold(
      onCheckoutCTAPressed: () => _onCheckoutCTAPressed(context),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, cartState) {
          final bool _shouldRenderCartEmptyState =
              (cartState is CartInitialized && cartState.storage.entries.isEmpty) || cartState is! CartInitialized;

          return CustomFadeAnimatedSwitcher(
              child: _shouldRenderCartEmptyState
                  ? const CartScreenEmptyContainer()
                  : CartScreenProductsContainer(entries: cartState.storage.entries));
        },
      ),
    );
  }
}

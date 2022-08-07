import 'package:blocs_at_scale/src/config/theme/index.dart';
import 'package:blocs_at_scale/src/models/cart_storage.dart';
import 'package:blocs_at_scale/src/screens/cart/components/cart_product_card.dart';
import 'package:flutter/material.dart';

class CartProductList extends StatefulWidget {
  final List<CartStorageEntry> entries;

  const CartProductList({
    required this.entries,
    Key? key,
  }) : super(key: key);

  @override
  State<CartProductList> createState() => _CartProductListState();
}

class _CartProductListState extends State<CartProductList> {
  final _listKey = GlobalKey<AnimatedListState>();
  final _offset = Tween(begin: const Offset(-1, 0), end: const Offset(0, 0));

  Widget _buildItem(int index, Animation<double> animation) => SlideTransition(
        position: animation.drive(_offset.chain(CurveTween(curve: Curves.easeOutCubic))),
        child: CartProductCard(
          key: ValueKey('product-$index'),
          product: widget.entries[index].product,
          quantity: widget.entries[index].quantity,
          onRemove: () => _onRemoveItem(index),
        ),
      );

  void _onRemoveItem(int index) => _listKey.currentState!.removeItem(
        index,
        (context, animation) => _buildItem(index, animation),
        duration: const Duration(milliseconds: 250),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.kAppMargin),
      child: AnimatedList(
          key: _listKey,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          initialItemCount: widget.entries.length,
          itemBuilder: (context, index, animation) => _buildItem(index, animation)),
    );
  }
}

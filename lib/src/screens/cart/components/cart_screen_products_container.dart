import 'package:blocs_at_scale/src/models/cart_storage.dart';
import 'package:blocs_at_scale/src/screens/cart/components/cart_product_list.dart';
import 'package:blocs_at_scale/src/utility_widgets/buttons/bottom_bar_cta_button.dart';
import 'package:blocs_at_scale/src/utility_widgets/misc/bottom_spacer.dart';
import 'package:flutter/material.dart';

class CartScreenProductsContainer extends StatelessWidget {
  final List<CartStorageEntry> entries;

  const CartScreenProductsContainer({
    required this.entries,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Align(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 44),
            CartProductList(entries: entries),
            const BottomSpacer(extension: kBottomBarCtaButtonHeight + 64),
          ],
        ),
      ),
    );
  }
}

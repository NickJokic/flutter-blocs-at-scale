import 'package:blocs_at_scale/src/blocs/index.dart';
import 'package:blocs_at_scale/src/config/theme/index.dart';
import 'package:blocs_at_scale/src/screens/cart/components/checkout_total_price_row.dart';
import 'package:blocs_at_scale/src/services/format_helper.dart';
import 'package:blocs_at_scale/src/utility_widgets/animated/custom_fade_animated_switcher.dart';
import 'package:blocs_at_scale/src/utility_widgets/buttons/bottom_bar_cta_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutCTAButton extends StatelessWidget {
  final void Function() onTap;

  const CheckoutCTAButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String _price;

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, cartState) {
        if (cartState is CartInitialized) {
          _price = context.read<FormatHelper>().formatPriceToString(cartState.storage.getCartTotalPrice());
        } else {
          _price = context.read<FormatHelper>().formatPriceToString(0);
        }

        final bool _shouldRenderCartEmptyState =
            (cartState is CartInitialized && cartState.storage.entries.isEmpty) || cartState is! CartInitialized;

        return CustomFadeAnimatedSwitcher(
            child: _shouldRenderCartEmptyState
                ? const SizedBox.shrink()
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CheckoutTotalPriceRow(price: _price),
                      BottomBarCTAButton(
                        onTap: onTap,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppImages.iconCheckout, height: 28),
                            const SizedBox(width: 4),
                            const Text('Checkout', style: AppTextStyles.button),
                          ],
                        ),
                      ),
                    ],
                  ));
      },
    );
  }
}

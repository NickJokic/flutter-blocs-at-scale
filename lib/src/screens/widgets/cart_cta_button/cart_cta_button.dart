import 'package:blocs_at_scale/src/blocs/index.dart';
import 'package:blocs_at_scale/src/config/theme/index.dart';
import 'package:blocs_at_scale/src/services/format_helper.dart';
import 'package:blocs_at_scale/src/utility_widgets/animated/custom_fade_animated_switcher.dart';
import 'package:blocs_at_scale/src/utility_widgets/buttons/bottom_bar_cta_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartCTAButton extends StatelessWidget {
  final void Function() onTap;

  const CartCTAButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, cartState) {
      final bool _visible = cartState is CartInitialized && cartState.storage.entries.isNotEmpty;
      final double _cartTotalPrice = cartState is CartInitialized ? cartState.storage.getCartTotalPrice() : 0;
      final String _cartTotalPriceString = context.read<FormatHelper>().formatPriceToString(_cartTotalPrice);

      return CustomFadeAnimatedSwitcher(
        child: _visible
            ? BottomBarCTAButton(
                onTap: onTap,
                child: Row(
                  children: [
                    SvgPicture.asset(AppImages.iconCart, height: 28),
                    const SizedBox(width: 16),
                    const Text('Go to cart', style: AppTextStyles.button),
                    const Spacer(),
                    CustomFadeAnimatedSwitcher(
                      child: Text(
                        _cartTotalPriceString,
                        style: AppTextStyles.button,
                        key: UniqueKey(),
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
      );
    });
  }
}

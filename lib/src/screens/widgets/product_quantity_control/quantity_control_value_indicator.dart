import 'package:blocs_at_scale/src/config/theme/index.dart';
import 'package:blocs_at_scale/src/screens/widgets/product_quantity_control/product_quantity_control.dart';
import 'package:flutter/material.dart';

class QuantityControlValueIndicator extends StatelessWidget {
  final bool isEmptyState;
  final int productCartQuantity;

  const QuantityControlValueIndicator({
    required this.isEmptyState,
    required this.productCartQuantity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kQuantityControlScaleAnimationDuration,
      curve: kQuantityControlScaleAnimationCurve,
      width: isEmptyState ? 0 : kProductQuantityControlSize,
      height: kProductQuantityControlSize,
      decoration: const BoxDecoration(color: AppColors.neutral5),
      child: Center(
          child: Text(
        productCartQuantity.toString(),
        style: AppTextStyles.sh2.copyWith(color: AppColors.neutral0),
      )),
    );
  }
}

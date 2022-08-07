import 'package:blocs_at_scale/src/config/theme/index.dart';
import 'package:blocs_at_scale/src/screens/widgets/product_quantity_control/product_quantity_control.dart';
import 'package:flutter/material.dart';

class QuantityControlDecrementButton extends StatelessWidget {
  final bool isEmptyState;
  final void Function() onTap;

  const QuantityControlDecrementButton({
    required this.isEmptyState,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: AnimatedContainer(
        duration: kQuantityControlScaleAnimationDuration,
        curve: kQuantityControlScaleAnimationCurve,
        width: isEmptyState ? 0 : kProductQuantityControlSize,
        height: kProductQuantityControlSize,
        decoration: const BoxDecoration(
          color: AppColors.neutral3,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(4.5), bottomLeft: Radius.circular(4.5)),
        ),
        child: const Icon(Icons.remove, color: AppColors.neutral1, size: 14),
      ),
    );
  }
}

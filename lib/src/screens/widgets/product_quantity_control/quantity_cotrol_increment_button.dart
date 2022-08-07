import 'package:blocs_at_scale/src/config/theme/index.dart';
import 'package:blocs_at_scale/src/screens/widgets/product_quantity_control/product_quantity_control.dart';
import 'package:flutter/material.dart';

class QuantityControlIncrementButton extends StatelessWidget {
  final void Function() onTap;
  final bool collapsed;

  const QuantityControlIncrementButton({
    required this.onTap,
    this.collapsed = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        width: kProductQuantityControlSize,
        height: kProductQuantityControlSize,
        decoration: BoxDecoration(
          color: AppColors.neutral3,
          borderRadius: collapsed == true
              ? const BorderRadius.all(Radius.circular(4.5))
              : const BorderRadius.only(topRight: Radius.circular(4.5), bottomRight: Radius.circular(4.5)),
        ),
        child: const Icon(Icons.add, color: AppColors.neutral1, size: 14),
      ),
    );
  }
}

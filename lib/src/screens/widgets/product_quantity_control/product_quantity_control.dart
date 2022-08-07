import 'package:blocs_at_scale/src/screens/widgets/product_quantity_control/quantity_control_decrement_button.dart';
import 'package:blocs_at_scale/src/screens/widgets/product_quantity_control/quantity_control_value_indicator.dart';
import 'package:blocs_at_scale/src/screens/widgets/product_quantity_control/quantity_cotrol_increment_button.dart';
import 'package:flutter/material.dart';

const double kProductQuantityControlSize = 36;
const Duration kQuantityControlScaleAnimationDuration = Duration(milliseconds: 200);
const Curve kQuantityControlScaleAnimationCurve = Curves.easeInOutQuad;
const int _kProductLimit = 10;

class ProductQuantityControl extends StatefulWidget {
  final int quantity;
  final void Function() onIncrement;
  final void Function() onDecrement;
  final bool autoCollapse;

  const ProductQuantityControl({
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    this.autoCollapse = true,
    Key? key,
  }) : super(key: key);

  @override
  State<ProductQuantityControl> createState() => _ProductQuantityControlState();
}

class _ProductQuantityControlState extends State<ProductQuantityControl> {
  @override
  Widget build(BuildContext context) {
    bool _isEmptyState = widget.autoCollapse == false ? false : widget.quantity == 0;

    return AnimatedContainer(
      curve: kQuantityControlScaleAnimationCurve,
      duration: kQuantityControlScaleAnimationDuration,
      height: kProductQuantityControlSize,
      width: _isEmptyState ? kProductQuantityControlSize : 3 * kProductQuantityControlSize,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Decrement button
          QuantityControlDecrementButton(
            isEmptyState: _isEmptyState,
            onTap: () => _onDecrement(widget.quantity),
          ),

          // Quantity value indicator
          QuantityControlValueIndicator(
            isEmptyState: _isEmptyState,
            productCartQuantity: widget.quantity,
          ),

          // Increment button
          QuantityControlIncrementButton(
            onTap: () => _onIncrement(widget.quantity),
            collapsed: _isEmptyState,
          ),
        ],
      ),
    );
  }

  void _onDecrement(int quantity) {
    if (quantity > 0) {
      widget.onDecrement();
    }
  }

  void _onIncrement(int quantity) {
    if (quantity < _kProductLimit) {
      widget.onIncrement();
    }
  }
}

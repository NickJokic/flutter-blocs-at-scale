import 'package:blocs_at_scale/src/utility_widgets/buttons/custom_elevated_button.dart';
import 'package:flutter/material.dart';

const double kBottomBarCtaButtonHeight = 96;

class BottomBarCTAButton extends StatelessWidget {
  final Widget child;
  final void Function() onTap;

  const BottomBarCTAButton({
    required this.child,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      size: const Size(double.infinity, kBottomBarCtaButtonHeight),
      borderRadius: 0,
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
          child: child,
        ),
      ),
      onPressed: onTap,
    );
  }
}

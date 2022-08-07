import 'package:blocs_at_scale/src/config/theme/app_constants.dart';
import 'package:flutter/material.dart';

class BottomSpacer extends StatelessWidget {
  final double extension;

  const BottomSpacer({
    this.extension = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: AppConstants.kScreenBottomSpace + extension);
  }
}

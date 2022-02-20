import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const double _kBlurCoeff = 0;
const double _kSpinnerSize = 48;
const double _kSpinnerLineWidth = 4;

/// Widget that displays a full-screen dialog with a loading [SpinKitRing] spinner.
///
/// Can be effectively used by calling :
/// `showDialog(context: context, barrierDismissible: false, builder: (context) => const FullscreenLoadingDialog());`
class FullscreenLoadingDialog extends StatelessWidget {
  const FullscreenLoadingDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: _kBlurCoeff, sigmaY: _kBlurCoeff),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            SpinKitRing(
              color: Colors.white,
              size: _kSpinnerSize,
              lineWidth: _kSpinnerLineWidth,
            )
          ],
        ),
      ),
    );
  }
}

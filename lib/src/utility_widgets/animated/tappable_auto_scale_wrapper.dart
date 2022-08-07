import 'package:flutter/material.dart';

const Duration _kAnimationDurationIn = Duration(milliseconds: 80);
const Duration _kAnimationDurationOut = Duration(milliseconds: 250);
const Curve _kAnimationCurve = Curves.easeInOut;

class TappableAutoScaleWrapper extends StatefulWidget {
  final Widget child;
  final Function()? onTap;
  final double beginTween;
  final double endTween;

  const TappableAutoScaleWrapper({
    required this.child,
    this.onTap,
    this.beginTween = 1.0,
    this.endTween = 0.97,
    Key? key,
  }) : super(key: key);

  @override
  _TappableAutoScaleWrapperState createState() => _TappableAutoScaleWrapperState();
}

class _TappableAutoScaleWrapperState extends State<TappableAutoScaleWrapper> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Tween<double> _tween;
  double _opacity = 1.0;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: _kAnimationDurationIn,
      reverseDuration: _kAnimationDurationOut,
    );

    _tween = Tween(begin: widget.beginTween, end: widget.endTween);
    _animation = _tween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: _kAnimationCurve,
      ),
    )..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  void dispose() {
    _animation.removeListener(() {});
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.onTap == null) {
      return widget.child;
    }

    return GestureDetector(
      onTapDown: (dp) {
        _animationController.forward();
        setState(() {
          _opacity = 0.9;
        });
      },
      onTapUp: (dp) {
        _animationController.reverse();
        setState(() {
          _opacity = 1.0;
        });
      },
      onTapCancel: () {
        _animationController.reverse();
        setState(() {
          _opacity = 1.0;
        });
      },
      onTap: widget.onTap,
      behavior: HitTestBehavior.translucent,
      child: AnimatedOpacity(
        duration: _kAnimationDurationIn,
        curve: _kAnimationCurve,
        opacity: _opacity,
        child: Transform.scale(
          scale: _animation.value,
          child: widget.child,
        ),
      ),
    );
  }
}

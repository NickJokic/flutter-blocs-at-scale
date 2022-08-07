import 'package:blocs_at_scale/src/config/routing/app_route_name.dart';
import 'package:blocs_at_scale/src/config/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppInitScreen extends StatefulWidget {
  const AppInitScreen({Key? key}) : super(key: key);

  @override
  State<AppInitScreen> createState() => _AppInitScreenState();
}

class _AppInitScreenState extends State<AppInitScreen> {
  bool visible = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 350));
      setState(() => visible = true);
      await Future.delayed(const Duration(milliseconds: 1500));
      setState(() => visible = false);
      await Future.delayed(const Duration(milliseconds: 750));
      Navigator.of(context).pushReplacementNamed(AppRouteName.home);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
          opacity: visible ? 1 : 0,
          duration: const Duration(milliseconds: 750),
          child: SvgPicture.asset(AppImages.logoWh, width: 154)),
    );
  }
}

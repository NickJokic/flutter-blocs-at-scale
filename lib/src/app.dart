import 'package:blocs_at_scale/src/config/routing/app_navigator.dart';
import 'package:blocs_at_scale/src/config/routing/app_route_name.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'BLOCs at Scale (Part 1)',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppNavigator.generateRoute,
      initialRoute: AppRouteName.appInit,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:blocs_at_scale/src/screens/home/home_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'BLOCs at Scale (Part 1)',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

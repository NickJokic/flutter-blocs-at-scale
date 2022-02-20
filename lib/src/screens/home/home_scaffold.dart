import 'package:flutter/material.dart';

class HomeScaffold extends StatelessWidget {
  final Widget child;

  const HomeScaffold({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('BLOCs at Scale (Part 1)'),
        backgroundColor: Colors.black87,
      ),
      body: child,
    );
  }
}

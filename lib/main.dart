import 'package:flutter/material.dart';

void main() {
  runApp(const SnapvidsApp());
}

class SnapvidsApp extends StatelessWidget {
  const SnapvidsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Snapvids',
      home: Scaffold(
        body: Center(
          child: Text('Demo Page'),
        ),
      ),
    );
  }
}

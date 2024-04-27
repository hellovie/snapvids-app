import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Center(child: Text('Discover Page'),)
      ),
    );
  }
}
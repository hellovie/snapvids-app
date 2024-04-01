import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  final int index;

  const DiscoverPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Discover Page'),
      ),
    );
  }
}

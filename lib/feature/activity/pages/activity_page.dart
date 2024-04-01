import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  final int index;

  const ActivityPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Activity Page'),
      ),
    );
  }
}

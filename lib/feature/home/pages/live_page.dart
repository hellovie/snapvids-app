import 'package:flutter/material.dart';

class LivePage extends StatefulWidget {
  const LivePage({
    Key? key,
  }) : super(key: key);

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Live Page'),
      ),
    );
  }
}

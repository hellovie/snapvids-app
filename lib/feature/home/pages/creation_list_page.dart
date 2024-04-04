import 'package:flutter/material.dart';

class CreationListPage extends StatefulWidget {
  const CreationListPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CreationListPage> createState() => _CreationListPageState();
}

class _CreationListPageState extends State<CreationListPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Creation List Page'),
      ),
    );
  }
}

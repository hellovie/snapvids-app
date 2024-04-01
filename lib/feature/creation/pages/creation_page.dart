import 'package:flutter/material.dart';
import 'package:snapvids_app/common/config/design_variables.dart';

class CreationPage extends StatefulWidget {
  final int index;

  const CreationPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<CreationPage> createState() => _CreationPageState();
}

class _CreationPageState extends State<CreationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            margin: const EdgeInsets.all(DesignVariables.spaceMedium),
            child: const Icon(
              Icons.close_rounded,
              size: DesignVariables.sizeLarge,
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text('Creation Page'),
      ),
    );
  }
}

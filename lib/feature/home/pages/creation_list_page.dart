import 'package:flutter/material.dart';
import 'package:snapvids_app/common/models/creation_model.dart';
import 'package:snapvids_app/feature/home/widgets/creation_item.dart';

class CreationListPage extends StatelessWidget {
  final List<CreationModel> creations;

  const CreationListPage(
    this.creations, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: creations.isEmpty
          ? const Center(
              child: Text('暂无作品'),
            )
          : PageView.builder(
              itemCount: creations.length,
              itemBuilder: (BuildContext context, int index) {
                return CreationItem(creations[index]);
              },
              scrollDirection: Axis.vertical,
            ),
    );
  }
}

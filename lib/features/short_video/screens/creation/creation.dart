import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapvids_app/utils/constants/ui_colors.dart';
import 'package:snapvids_app/utils/devices/device_utils.dart';

class CreationScreen extends StatelessWidget {
  const CreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = DeviceUtils.getStatusBarHeight();

    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: Container(
        padding: EdgeInsets.only(top: statusBarHeight),
        child: Stack(
          children: [
            IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                CupertinoIcons.clear,
                color: UiColors.creationScreenIcon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

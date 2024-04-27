import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';
import 'package:snapvids_app/utils/devices/device_utils.dart';
import 'package:snapvids_app/utils/themes/extension/color_extension.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = DeviceUtils.getStatusBarHeight();
    final width = DeviceUtils.getScreenWidth();
    final height = DeviceUtils.getScreenHeight();

    return Container(
      width: width,
      height: (height - statusBarHeight) / 3,
      padding: const EdgeInsets.all(UiSizes.md),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => Get.back(),
                child: Icon(
                  CupertinoIcons.clear_circled_solid,
                  color: context.colorExtension.iconSecondary,
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Text(
                '暂不支持分享作品',
                style: context.textTheme.titleMedium!.copyWith(
                  color: context.colorExtension.textPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

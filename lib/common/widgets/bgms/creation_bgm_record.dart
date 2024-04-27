import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapvids_app/common/widgets/bgms/creation_bgm_details.dart';
import 'package:snapvids_app/utils/constants/image_assets.dart';
import 'package:snapvids_app/utils/constants/ui_colors.dart';
import 'package:snapvids_app/utils/constants/ui_enums.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';

class CreationBgmRecord extends StatelessWidget {
  const CreationBgmRecord({
    super.key,
    required this.playStatus,
    required this.bgmCoverUrl,
    required this.onPlay,
  });

  final PlayStatus playStatus;
  final String bgmCoverUrl;
  final ValueChanged<PlayStatus> onPlay;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(const CreationBgmDetails());
      },
      child: Container(
        width: UiSizes.creationBgmRecord,
        height: UiSizes.creationBgmRecord,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: UiColors.creationBgmRecordBackground,
        ),
        child: Center(
          // child: AnimatedBuilder(
          //   animation: _rotationController,
          //   builder: (BuildContext context, Widget? child) {
          //     return Transform.rotate(
          //       angle: _rotationController.value * 2 * pi,
          child: Container(
            width: UiSizes.creationBgmRecord - UiSizes.creationBgmRecordPadding,
            height: UiSizes.creationBgmRecord - UiSizes.creationBgmRecordPadding,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: bgmCoverUrl,
                placeholder: (context, url) => Image.asset(ImageAssets.bgmCover),
                errorWidget: (context, url, error) => Image.asset(ImageAssets.bgmCover),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //       );
          //     },
          //   ),
        ),
      ),
    );
  }
}

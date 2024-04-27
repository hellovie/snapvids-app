import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:snapvids_app/utils/constants/image_assets.dart';
import 'package:snapvids_app/utils/constants/ui_colors.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';

class CreationAvatar extends StatelessWidget {
  const CreationAvatar({
    super.key,
    required this.isFollowed,
    required this.avatarUrl,
    required this.onFollowed,
  });

  final bool isFollowed;
  final String avatarUrl;
  final ValueChanged<bool> onFollowed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: UiSizes.creationAvatarBox,
      height: UiSizes.creationAvatarBox,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: UiSizes.creationAvatar,
              height: UiSizes.creationAvatar,
              decoration: BoxDecoration(
                border: Border.all(
                  width: UiSizes.creationAvatarBorder,
                  color: UiColors.creationAvatarBorder,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(UiSizes.creationAvatar),
                ),
              ),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: avatarUrl,
                  placeholder: (context, url) => Image.asset(ImageAssets.avatar),
                  errorWidget: (context, url, error) => Image.asset(ImageAssets.avatar),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: UiSizes.creationAvatar -
                UiSizes.creationAvatarBorder -
                UiSizes.creationFollow / 2,
            left: UiSizes.creationAvatarBox / 2 - UiSizes.creationFollow / 2,
            child: isFollowed
                ? const SizedBox()
                : InkWell(
                    onTap: () => onFollowed(!isFollowed),
                    child: Container(
                      width: UiSizes.creationFollow,
                      height: UiSizes.creationFollow,
                      decoration: const BoxDecoration(
                        color: UiColors.primary,
                        borderRadius: BorderRadius.all(
                          Radius.circular(UiSizes.creationFollow),
                        ),
                      ),
                      child: const Icon(
                        Icons.add_rounded,
                        size: UiSizes.creationFollow - UiSizes.creationFollowPadding,
                        color: UiColors.onPrimary,
                      ),
                    ),
                  ),
            // Container(
            //   width: UiSizes.creationFollowSize,
            //   height: UiSizes.creationFollowSize,
            //   decoration: const BoxDecoration(
            //     color: UiColors.onPrimary,
            //     borderRadius: BorderRadius.all(
            //       Radius.circular(UiSizes.creationFollowSize),
            //     ),
            //   ),
            //   child: const Icon(
            //     Icons.check_rounded,
            //     size: UiSizes.creationFollowSize - UiSizes.creationFollowPadding,
            //     color: UiColors.primary,
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}

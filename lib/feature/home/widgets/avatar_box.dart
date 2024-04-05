import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:snapvids_app/common/config/common_colors.dart';
import 'package:snapvids_app/common/config/design_variables.dart';
import 'package:snapvids_app/common/widgets/toast.dart';

const Color avatarBgColor = Colors.white;
const String defaultAvatarAssetName = 'assets/images/avatar_placeholder.jpg';

class AvatarBox extends StatelessWidget {
  final double width;
  final double height;
  final String avatarUrl;
  final bool isFollowed;
  final Function(bool) onFollowButtonClick;

  const AvatarBox({
    Key? key,
    required this.width,
    required this.height,
    required this.avatarUrl,
    required this.isFollowed,
    required this.onFollowButtonClick,
  }) : super(key: key);

  void follow() {
    onFollowButtonClick(!isFollowed);
  }

  @override
  Widget build(BuildContext context) {
    const double iconSize = DesignVariables.sizeMedium;

    return SizedBox(
      width: width,
      height: height + iconSize / 2,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: InkWell(
              onTap: () {
                Toast.show('敬请期待');
              },
              child: Container(
                width: width,
                height: height,
                padding: const EdgeInsets.all(DesignVariables.spaceMini),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: avatarBgColor,
                ),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: avatarUrl,
                    placeholder: (context, url) => Image.asset(defaultAvatarAssetName),
                    errorWidget: (context, url, error) => Image.asset(defaultAvatarAssetName),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: width / 2 - iconSize / 2,
            child: isFollowed
                ? const SizedBox()
                : Container(
                    width: iconSize,
                    height: iconSize,
                    padding: EdgeInsets.zero,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      color: CommonColors.primary,
                      iconSize: iconSize,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      icon: const Icon(Icons.add_circle),
                      onPressed: follow,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

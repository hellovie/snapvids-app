import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapvids_app/common/widgets/avatar/creation_avatar.dart';
import 'package:snapvids_app/common/widgets/bgms/creation_bgm_record.dart';
import 'package:snapvids_app/common/widgets/collects/creation_collect_action.dart';
import 'package:snapvids_app/common/widgets/comments/creation_comment_action.dart';
import 'package:snapvids_app/common/widgets/creations/creation_description_box.dart';
import 'package:snapvids_app/common/widgets/likes/creation_like_action.dart';
import 'package:snapvids_app/common/widgets/shares/creation_share_action.dart';
import 'package:snapvids_app/common/widgets/common/space.dart';
import 'package:snapvids_app/features/short_video/models/creation_model.dart';
import 'package:snapvids_app/utils/constants/ui_colors.dart';
import 'package:snapvids_app/utils/constants/ui_enums.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';

const double bottomSpace = UiSizes.md;
const double rightSpace = UiSizes.sm;
const double leftSpace = UiSizes.md;
const double draggingOpacity = 0.3;
const double stoppingOpacity = 1.0;

class CreationView extends StatelessWidget {
  const CreationView({
    super.key,
    required this.model,
    required this.onChanged,
  });

  final CreationModel model;
  final ValueChanged<CreationModel> onChanged;

  @override
  Widget build(BuildContext context) {
    final Rx<double> dragOpacity = stoppingOpacity.obs;
    final Rx<PlayStatus> playStatus = PlayStatus.init.obs;

    final String authorAvatarUrl = model.authorAvatarUrl;
    final Rx<bool> isFollowed = model.isFollowed.obs;
    final Rx<bool> isLiked = model.isLiked.obs;
    final Rx<int> likeCount = model.likeCount.obs;
    final Rx<bool> isCollected = model.isCollected.obs;
    final Rx<int> collectCount = model.collectCount.obs;
    final Rx<int> commentCount = model.commentCount.obs;
    final Rx<int> shareCount = model.shareCount.obs;
    final String authorNickname = model.authorNickname;
    final String caption = model.caption;
    final String bgmName = model.bgmName;
    final String bgmCoverUrl = model.bgmCoverUrl;
    final List<String> tags = model.tags;
    final String hotSearchKey = model.hotSearchKey;

    void handlePlayEvent() {
      playStatus.value = playStatus.value == PlayStatus.play ? PlayStatus.pause : PlayStatus.play;
    }

    return Scaffold(
      body: InkWell(
        onTap: handlePlayEvent,
        child: GestureDetector(
          onPanUpdate: (details) => dragOpacity.value = draggingOpacity,
          onPanEnd: (details) => dragOpacity.value = stoppingOpacity,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                Positioned(
                  right: rightSpace,
                  bottom: bottomSpace,
                  child: Space(
                    size: UiSizes.md,
                    direction: Axis.vertical,
                    children: [
                      Obx(
                        () => Opacity(
                          opacity: dragOpacity.value,
                          child: CreationAvatar(
                            isFollowed: isFollowed.value,
                            avatarUrl: authorAvatarUrl,
                            onFollowed: (bool value) {
                              isFollowed.value = value;
                            },
                          ),
                        ),
                      ),
                      Obx(
                        () => Opacity(
                          opacity: dragOpacity.value,
                          child: CreationLikeAction(
                            isLiked: isLiked.value,
                            count: likeCount.value,
                            onLiked: (bool curIsLiked, int curCount) {
                              isLiked.value = curIsLiked;
                              likeCount.value = curCount;
                            },
                          ),
                        ),
                      ),
                      Obx(
                        () => Opacity(
                          opacity: dragOpacity.value,
                          child: CreationCommentAction(
                            count: commentCount.value,
                            hotSearchKey: hotSearchKey,
                          ),
                        ),
                      ),
                      Obx(
                        () => Opacity(
                          opacity: dragOpacity.value,
                          child: CreationCollectAction(
                            isCollected: isCollected.value,
                            count: collectCount.value,
                            onCollected: (bool curIsCollected, int curCount) {
                              isCollected.value = curIsCollected;
                              collectCount.value = curCount;
                            },
                          ),
                        ),
                      ),
                      Obx(
                        () => Opacity(
                          opacity: dragOpacity.value,
                          child: CreationShareAction(
                            count: shareCount.value,
                          ),
                        ),
                      ),
                      Obx(
                        () => Opacity(
                          opacity: dragOpacity.value,
                          child: CreationBgmRecord(
                            playStatus: playStatus.value,
                            bgmCoverUrl: bgmCoverUrl,
                            onPlay: (PlayStatus curPlayStatus) {
                              playStatus.value = curPlayStatus;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: leftSpace,
                  bottom: bottomSpace,
                  child: Obx(
                    () => Opacity(
                      opacity: dragOpacity.value,
                      child: CreationDescriptionBox(
                        authorNickname: authorNickname,
                        caption: caption,
                        bgmName: bgmName,
                        tags: tags,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Obx(
                    () => Visibility(
                      visible: playStatus.value == PlayStatus.pause,
                      child: Center(
                        child: Icon(
                          Icons.play_arrow_rounded,
                          size: UiSizes.creationPauseIcon,
                          color: UiColors.creationPauseIcon,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

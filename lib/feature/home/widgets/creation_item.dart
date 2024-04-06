import 'package:flutter/material.dart';
import 'package:image_pixels/image_pixels.dart';
import 'package:snapvids_app/common/config/design_variables.dart';
import 'package:snapvids_app/common/config/icon_assets.dart';
import 'package:snapvids_app/common/enums/ui_enums.dart';
import 'package:snapvids_app/common/extension/custom_theme_extension.dart';
import 'package:snapvids_app/common/models/creation_model.dart';
import 'package:snapvids_app/common/routes/routes.dart';
import 'package:snapvids_app/common/utils/number_utils.dart';
import 'package:snapvids_app/common/widgets/space.dart';
import 'package:snapvids_app/common/widgets/toast.dart';
import 'package:snapvids_app/feature/home/pages/network_error_page.dart';
import 'package:snapvids_app/feature/home/widgets/avatar_box.dart';
import 'package:snapvids_app/feature/home/widgets/creation_bgm_disc.dart';
import 'package:snapvids_app/feature/home/widgets/creation_description_box.dart';
import 'package:snapvids_app/feature/home/widgets/pause_video_button.dart';
import 'package:video_player/video_player.dart';

import 'action_box.dart';
import 'creation_player.dart';

const double actionBoxHeight = 56;
const double actionBoxWidth = 74;
const double spaceSize = DesignVariables.spaceLarge;

class CreationItem extends StatefulWidget {
  final double elementOpacity;
  final CreationModel creation;

  const CreationItem(
    this.creation, {
    Key? key,
    this.elementOpacity = 1,
  }) : super(key: key);

  @override
  State<CreationItem> createState() => _CreationItemState();
}

class _CreationItemState extends State<CreationItem> {
  late CreationModel _creation;
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;
  bool isFetchFail = false;

  void _showCommentSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(DesignVariables.borderRadiusLarge),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        final statusBarHeight = MediaQuery.of(context).padding.top;
        final width = MediaQuery.of(context).size.width;
        final height = MediaQuery.of(context).size.height;

        return Container(
          width: width,
          height: (height - statusBarHeight) / 3 * 2,
          padding: const EdgeInsets.all(DesignVariables.spaceMedium),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 5,
                  width: 30,
                  margin: const EdgeInsets.only(bottom: DesignVariables.spaceMedium),
                  decoration: BoxDecoration(
                    color: context.theme.gray_4,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Text(
                      '${NumberUtils.formatNumberWithChineseUnit(_creation.commentCount.toDouble())}条评论',
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(
                          Icons.close_rounded,
                          size: DesignVariables.sizeMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: Center(
                  child: Text('暂不支持评论作品'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showShareSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(DesignVariables.borderRadiusLarge),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        final statusBarHeight = MediaQuery.of(context).padding.top;
        final width = MediaQuery.of(context).size.width;
        final height = MediaQuery.of(context).size.height;

        return Container(
          width: width,
          height: (height - statusBarHeight) / 3,
          padding: const EdgeInsets.all(DesignVariables.spaceMedium),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(
                      Icons.close_rounded,
                      size: DesignVariables.sizeMedium,
                    ),
                  ),
                ],
              ),
              const Expanded(
                child: Center(
                  child: Text('暂不支持分享作品'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _initVideoPlayer() {
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(_creation.creationUrl));
    _initializeVideoPlayerFuture = _videoPlayerController.initialize().then((_) {
      _videoPlayerController.play();
      _videoPlayerController.setLooping(true);
      setState(() {});
    }).catchError((onError) {
      Toast.show('视频加载失败');
      setState(() {
        isFetchFail = true;
      });
    });
  }

  void _refreshVideoPlayer() {
    _videoPlayerController.dispose();
    setState(() {
      isFetchFail = false;
    });
    _initVideoPlayer();
  }

  @override
  void initState() {
    _creation = widget.creation.copyWith();
    _initVideoPlayer();
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: isFetchFail
          ? NetWorkErrorPage(onRefresh: _refreshVideoPlayer)
          : InkWell(
              onTap: () {
                PlayState nextState =
                    _creation.playState == PlayState.pause ? PlayState.play : PlayState.pause;
                if (nextState == PlayState.pause) {
                  _videoPlayerController.pause();
                } else {
                  _videoPlayerController.play();
                }
                setState(() {
                  _creation = _creation.copyWith(playState: nextState);
                });
              },
              child: Stack(
                children: [
                  ImagePixels.container(
                    // Todo(fix): 背景图片加载与视频加载不同步问题需要处理
                    imageProvider: NetworkImage(_creation.coverUrl),
                    child: SizedBox(
                      width: screenWidth,
                      height: screenHeight,
                      child: Center(
                        child: CreationPlayer(
                          videoPlayerController: _videoPlayerController,
                          initializeVideoPlayerFuture: _initializeVideoPlayerFuture,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: spaceSize,
                    child: SizedBox(
                      child: Space(
                        direction: Axis.vertical,
                        size: DesignVariables.spaceLarge,
                        children: [
                          AvatarBox(
                            width: actionBoxHeight,
                            height: actionBoxHeight,
                            avatarUrl: _creation.authorAvatarUrl,
                            isFollowed: _creation.isFollowed,
                            onFollowButtonClick: (followStatus) {
                              setState(() {
                                _creation = _creation.copyWith(isFollowed: followStatus);
                              });
                            },
                          ),
                          ActionBox(
                            width: actionBoxWidth,
                            height: actionBoxHeight,
                            count: _creation.likeCount,
                            isActive: _creation.isLiked,
                            iconAssetName: IconAssets.like,
                            onTap: (isActive) {
                              setState(() {
                                _creation = _creation.copyWith(
                                  isLiked: isActive,
                                  likeCount:
                                      isActive ? _creation.likeCount + 1 : _creation.likeCount - 1,
                                );
                              });
                            },
                          ),
                          ActionBox(
                            width: actionBoxWidth,
                            height: actionBoxHeight,
                            count: _creation.commentCount,
                            iconAssetName: IconAssets.comment,
                            onTap: (isActive) => _showCommentSheet(context),
                          ),
                          ActionBox(
                            width: actionBoxWidth,
                            height: actionBoxHeight,
                            count: _creation.collectCount,
                            isActive: _creation.isCollectd,
                            iconAssetName: IconAssets.collect,
                            onTap: (isActive) {
                              setState(() {
                                _creation = _creation.copyWith(
                                  isCollectd: isActive,
                                  collectCount: isActive
                                      ? _creation.collectCount + 1
                                      : _creation.collectCount - 1,
                                );
                              });
                            },
                          ),
                          ActionBox(
                            width: actionBoxWidth,
                            height: actionBoxHeight,
                            count: _creation.shareCount,
                            iconAssetName: IconAssets.share,
                            onTap: (isActive) => _showShareSheet(context),
                          ),
                          CreationBgmDisc(
                            width: actionBoxHeight,
                            height: actionBoxHeight,
                            isPlay: _creation.playState != PlayState.pause,
                            coverUrl: _creation.bgmCoverUrl,
                            onTap: () {
                              Toast.show('敬请期待');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: spaceSize,
                    bottom: spaceSize,
                    child: SizedBox(
                      width: screenWidth - spaceSize - actionBoxWidth - actionBoxWidth / 2,
                      child: CreationDescriptionBox(
                        authorNickname: _creation.authorNickname,
                        caption: _creation.caption,
                        bgmName: _creation.bgmName,
                      ),
                    ),
                  ),
                  PauseVideoButton(
                    isPause: _creation.playState == PlayState.pause,
                  ),
                ],
              ),
            ),
    );
  }
}

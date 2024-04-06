import 'package:flutter/material.dart';
import 'package:snapvids_app/common/animations/loading_animation.dart';
import 'package:video_player/video_player.dart';

// Todo(fix): 不支持流式传输视频问题需要处理
class CreationPlayer extends StatelessWidget {
  final VideoPlayerController videoPlayerController;
  final Future<void> initializeVideoPlayerFuture;

  const CreationPlayer({
    Key? key,
    required this.videoPlayerController,
    required this.initializeVideoPlayerFuture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (videoPlayerController.value.hasError) {
            return const SizedBox();
          } else {
            return SizedBox(
              width: double.infinity,
              child: AspectRatio(
                aspectRatio: videoPlayerController.value.aspectRatio,
                child: VideoPlayer(videoPlayerController),
              ),
            );
          }
        } else {
          return const Center(
            child: LoadingAnimation(),
          );
        }
      },
    );
  }
}

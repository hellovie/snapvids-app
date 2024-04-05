import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:snapvids_app/common/config/design_variables.dart';

const Color bgmBgColor = Colors.white12;
const String defaultBgmCoverAssetName = 'assets/images/bgm_placeholder.png';
const Duration rotationDuration = Duration(seconds: 10);

class CreationBgmDisc extends StatefulWidget {
  final double width;
  final double height;
  final bool isPlay;
  final String coverUrl;
  final VoidCallback onTap;

  const CreationBgmDisc({
    Key? key,
    required this.width,
    required this.height,
    required this.isPlay,
    required this.coverUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CreationBgmDisc> createState() => _CreationBgmDisc();
}

class _CreationBgmDisc extends State<CreationBgmDisc> with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;

  void _initRotationBasedOnIsPlay() {
    if (widget.isPlay) {
      _rotationController.repeat();
    } else {
      _rotationController.stop(canceled: true);
    }
  }

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: rotationDuration,
    );
    _initRotationBasedOnIsPlay();
  }

  @override
  void didUpdateWidget(CreationBgmDisc oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isPlay != widget.isPlay) {
      _initRotationBasedOnIsPlay();
    }
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: bgmBgColor,
      ),
      child: InkWell(
        onTap: widget.onTap,
        child: Center(
          child: AnimatedBuilder(
            animation: _rotationController,
            builder: (BuildContext context, Widget? child) {
              return Transform.rotate(
                angle: _rotationController.value * 2 * pi,
                child: Container(
                  width: widget.width - DesignVariables.spaceLarge,
                  height: widget.height - DesignVariables.spaceLarge,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: widget.coverUrl,
                      placeholder: (context, url) => Image.asset(defaultBgmCoverAssetName),
                      errorWidget: (context, url, error) => Image.asset(defaultBgmCoverAssetName),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

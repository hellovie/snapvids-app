import 'package:flutter/material.dart';
import 'package:snapvids_app/common/config/design_variables.dart';
import 'package:snapvids_app/common/widgets/space.dart';

class CreationDescriptionBox extends StatelessWidget {
  final String authorNickname;
  final String caption;
  final String bgmName;

  const CreationDescriptionBox({
    Key? key,
    required this.authorNickname,
    required this.caption,
    required this.bgmName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Space(
      direction: Axis.vertical,
      size: DesignVariables.spaceMedium,
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: '@',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(text: authorNickname),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: RichText(
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  text: TextSpan(text: caption),
                ),
              ),
            ],
          ),
        ),
        IntrinsicHeight(
          child: Row(
            children: [
              const Icon(
                Icons.music_note_rounded,
                size: DesignVariables.sizeMini,
                color: Colors.white,
              ),
              const Space(size: DesignVariables.spaceMini),
              Expanded(
                child: RichText(
                  text: TextSpan(text: bgmName),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

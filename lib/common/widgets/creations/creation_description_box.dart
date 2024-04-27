import 'package:flutter/material.dart';
import 'package:snapvids_app/common/styles/font_styles.dart';
import 'package:snapvids_app/common/widgets/common/space.dart';
import 'package:snapvids_app/utils/constants/ui_colors.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';
import 'package:snapvids_app/utils/devices/device_utils.dart';

class CreationDescriptionBox extends StatelessWidget {
  const CreationDescriptionBox({
    super.key,
    required this.authorNickname,
    required this.caption,
    required this.bgmName,
    required this.tags,
  });

  final String authorNickname;
  final String caption;
  final String bgmName;
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    final double width = DeviceUtils.getScreenWidth() - UiSizes.creationActionBoxWidth * 2;
    List<InlineSpan> genTagsInlineSpan() {
      if (tags.isEmpty) {
        return [];
      }

      List<InlineSpan> tagsInlineSpan = [];
      tagsInlineSpan.add(const WidgetSpan(child: SizedBox(width: UiSizes.xs)));
      for (String tag in tags) {
        tagsInlineSpan.add(TextSpan(text: '#$tag', style: FontStyles.creationTagNormal));
        tagsInlineSpan.add(const WidgetSpan(child: SizedBox(width: UiSizes.xs)));
      }
      return tagsInlineSpan;
    }

    return SizedBox(
      width: width,
      child: Space(
        direction: Axis.vertical,
        size: UiSizes.xs,
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: '@$authorNickname',
                      style: FontStyles.creationAuthorNickNameNormal,
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
                    text: TextSpan(
                      text: caption,
                      style: FontStyles.creationDescriptionNormal,
                      children: genTagsInlineSpan(),
                    ),
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
                  size: UiSizes.md,
                  color: UiColors.creationPrimaryFont,
                ),
                const Space(size: UiSizes.xs),
                Expanded(
                  child: RichText(
                    text: TextSpan(text: bgmName, style: FontStyles.creationBgmNameNormal),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

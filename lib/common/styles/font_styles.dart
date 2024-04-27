import 'package:flutter/material.dart';
import 'package:snapvids_app/utils/constants/ui_colors.dart';

class FontStyles {
  FontStyles._();

  // 定义应用于大型显示级文本的样式，如页面标题、海报文字、全屏提示等显著的、视觉上突出的文本。
  static const TextStyle displayLarge = TextStyle(
    fontSize: 57.0,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    height: 1.12,
  );

  // 适用于中等尺寸的显示级文本，作为 displayLarge 的次级选项，用于那些需要较大但不如 displayLarge 那么突出的文本元素。
  static const TextStyle displayMedium = TextStyle(
    fontSize: 45.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    height: 1.16,
  );

  // 用于小型但仍然具有显示性质的文本，如卡片标题、模块标题等。
  static const TextStyle displaySmall = TextStyle(
    fontSize: 36.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    height: 1.22,
  );

  // 通常对应于应用或页面的主要标题，是内容结构中的最高级别标题。
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    height: 1.25,
  );

  // 用于次级标题或子标题，其重要性低于 headlineLarge。
  static const TextStyle headlineMedium = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    height: 1.29,
  );

  // 应用于更低级别的标题或辅助说明性文本，进一步细分内容区域。
  static const TextStyle headlineSmall = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    height: 1.33,
  );

  // 可能用于较大的区块标题或者模块标题，相对于 headline 系列，可能更偏向于功能性而非内容结构上的标题。
  static const TextStyle titleLarge = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    height: 1.27,
  );

  // 类似于 titleLarge，但用于较小或次要的区块标题。
  static const TextStyle titleMedium = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    height: 1.50,
  );

  // 最小级别的功能性标题或标签，用于较小的界面元素或次要信息。
  static const TextStyle titleSmall = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.10,
    height: 1.43,
  );

  // 用于较大字号的正文文本，如段落、简介等，通常用于需要突出阅读体验或强调内容的场合。
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.50,
    height: 1.50,
  );

  //  常规的正文文本样式，适用于大部分普通文本内容，如文章主体、列表项描述等。
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.43,
  );

  // 较小字号的正文文本，用于辅助信息、注释、版权声明等需要紧凑展示的内容。
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.40,
    height: 1.33,
  );

  // 用于较大尺寸的标签、按钮文本、表单标签等，需要突出显示的辅助性文本。
  static const TextStyle labelLarge = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.10,
    height: 1.43,
  );

  // 通用的标签、按钮文本、表单标签样式，适用于大多数场景下的标签文本。
  static const TextStyle labelMedium = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.50,
    height: 1.33,
  );

  // 小型标签或次要文本标签，常用于空间有限或需要低调展示的场景。
  static const TextStyle labelSmall = TextStyle(
    fontSize: 11.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.50,
    height: 1.45,
  );

  // 按钮默认字体大小
  static const TextStyle buttonNormal = labelLarge;

  // 输入框默认字体大小
  static const TextStyle inputFieldNormal = labelLarge;

  // 作品操作按钮下方的字体
  static final TextStyle creationActionNormal = labelSmall.copyWith(
    color: UiColors.creationPrimaryFont,
    shadows: _homeScreenFontShadows,
  );

  // 作品作者昵称的字体
  static final TextStyle creationAuthorNickNameNormal = bodyLarge.copyWith(
    color: UiColors.creationPrimaryFont,
    shadows: _homeScreenFontShadows,
    fontWeight: FontWeight.bold,
  );

  // 作品描述的字体
  static final TextStyle creationDescriptionNormal = bodyMedium.copyWith(
    color: UiColors.creationSecondaryFont,
    shadows: _homeScreenFontShadows,
  );

  // 作品标签的字体
  static final TextStyle creationTagNormal = bodyMedium.copyWith(
    color: UiColors.creationPrimaryFont,
    shadows: _homeScreenFontShadows,
  );

  // 作品背景音乐名称的字体
  static final TextStyle creationBgmNameNormal = bodyMedium.copyWith(
    color: UiColors.creationPrimaryFont,
    shadows: _homeScreenFontShadows,
  );

  // 作品的字体阴影
  static final List<Shadow> _homeScreenFontShadows = [
    Shadow(
      offset: const Offset(1.0, 1.0),
      blurRadius: 2.0,
      color: UiColors.creationFontShadow,
    ),
  ];
}

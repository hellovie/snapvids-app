import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:snapvids_app/common/styles/font_styles.dart';
import 'package:snapvids_app/common/widgets/animations/common_loading.dart';
import 'package:snapvids_app/utils/constants/ui_colors.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';

class ToastHelper {
  ToastHelper._();

  static const short = Duration(milliseconds: 2000);
  static const standard = Duration(milliseconds: 3500);
  static const long = Duration(milliseconds: 5000);

  static void showLoading() {
    _loadingToastStyle();
    EasyLoading.show(
      maskType: EasyLoadingMaskType.none,
      dismissOnTap: false,
    );
  }

  static void dismissLoading() {
    EasyLoading.dismiss();
  }

  static void show(
    String message, {
    Duration duration = short,
    EasyLoadingToastPosition toastPosition = EasyLoadingToastPosition.bottom,
    EasyLoadingMaskType maskType = EasyLoadingMaskType.none,
    bool dismissOnTap = true,
  }) {
    _defaultToastStyle();
    EasyLoading.showToast(
      message,
      duration: duration,
      toastPosition: toastPosition,
      maskType: maskType,
      dismissOnTap: dismissOnTap,
    );
  }

  static void info(
    String message, {
    Duration duration = short,
    EasyLoadingMaskType maskType = EasyLoadingMaskType.none,
    bool dismissOnTap = true,
  }) {
    _defaultToastStyle();
    EasyLoading.showInfo(
      message,
      duration: duration,
      maskType: maskType,
      dismissOnTap: dismissOnTap,
    );
  }

  static void success(
    String message, {
    Duration duration = short,
    EasyLoadingMaskType maskType = EasyLoadingMaskType.none,
    bool dismissOnTap = true,
  }) {
    _defaultToastStyle();
    EasyLoading.showSuccess(
      message,
      duration: duration,
      maskType: maskType,
      dismissOnTap: dismissOnTap,
    );
  }

  static void error(
    String message, {
    Duration duration = short,
    EasyLoadingMaskType maskType = EasyLoadingMaskType.none,
    bool dismissOnTap = true,
  }) {
    _defaultToastStyle();
    EasyLoading.showError(
      message,
      duration: duration,
      maskType: maskType,
      dismissOnTap: dismissOnTap,
    );
  }

  static void _loadingToastStyle() {
    EasyLoading.instance
      ..backgroundColor = Colors.transparent
      ..userInteractions = false;
  }

  static void _defaultToastStyle() {
    EasyLoading.instance
      ..displayDuration = short
      ..animationStyle = EasyLoadingAnimationStyle.opacity
      ..indicatorWidget = const CommonLoading()
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorColor = UiColors.toastIndicator
      ..progressColor = UiColors.toastProgress
      ..backgroundColor = UiColors.toastBackground
      ..radius = UiSizes.toastRadius
      ..indicatorSize = UiSizes.toastIndicator
      ..textColor = UiColors.toastText
      ..boxShadow = []
      ..textStyle = FontStyles.labelLarge.copyWith(color: UiColors.toastText)
      ..contentPadding = const EdgeInsets.symmetric(
        horizontal: UiSizes.toastHorizontalPadding,
        vertical: UiSizes.toastVerticalPadding,
      )
      ..maskType = EasyLoadingMaskType.none
      ..userInteractions = true
      ..dismissOnTap = true;
  }

  static TransitionBuilder init() {
    _defaultToastStyle();
    return EasyLoading.init();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:snapvids_app/common/animations/loading_animation.dart';
import 'package:snapvids_app/common/config/common_colors.dart';
import 'package:snapvids_app/common/config/design_variables.dart';

class HelperToasts {
  HelperToasts._();

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
      // ..indicatorType = EasyLoadingIndicatorType.threeBounce
      ..indicatorWidget = Container(
        width: DesignVariables.loadingAnimationSize,
        height: DesignVariables.loadingAnimationSize,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(DesignVariables.borderRadiusMedium),
        ),
        alignment: Alignment.center,
        child: const LoadingAnimation(),
      )
      ..loadingStyle = EasyLoadingStyle.custom
      ..textColor = Colors.white
      ..indicatorColor = CommonColors.primary
      ..progressColor = Colors.white
      ..backgroundColor = Colors.black54
      ..boxShadow = []
      ..radius = DesignVariables.borderRadiusMedium
      ..indicatorSize = 40.0
      ..fontSize = 15
      ..maskType = EasyLoadingMaskType.none
      ..userInteractions = true
      ..dismissOnTap = true;
  }

  static TransitionBuilder init() {
    _defaultToastStyle();
    return EasyLoading.init();
  }
}

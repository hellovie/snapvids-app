import 'package:flutter/material.dart';
import 'package:snapvids_app/common/config/design_variables.dart';
import 'package:snapvids_app/common/extension/custom_theme_extension.dart';

/// 表单输入框
class InputFormField extends StatelessWidget {
  // 自定义属性
  final Color? bgColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;

  // 方法属性
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;

  // 数据属性
  final TextEditingController? controller;
  final String? hintText;

  // 样式属性
  final double? width;
  final double? height;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final bool obscureText;
  final bool autoFocus;

  const InputFormField({
    Key? key,
    this.bgColor,
    this.borderRadius,
    this.padding,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.controller,
    this.hintText,
    this.width,
    this.height,
    this.decoration,
    this.keyboardType,
    this.style,
    this.obscureText = false,
    this.autoFocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.symmetric(horizontal: DesignVariables.spaceLarge),
      decoration: BoxDecoration(
        color: bgColor ?? context.theme.gray_3,
        borderRadius: BorderRadius.circular(borderRadius ?? DesignVariables.borderRadiusMedium),
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          onTap: onTap,
          onEditingComplete: onEditingComplete,
          keyboardType: keyboardType,
          obscureText: obscureText,
          style: style,
          autofocus: autoFocus,
          decoration: decoration ??
              InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
              ),
        ),
      ),
    );
  }
}

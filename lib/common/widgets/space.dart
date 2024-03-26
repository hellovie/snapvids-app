import 'package:flutter/material.dart';
import 'package:snapvids_app/common/config/design_variables.dart';

/// 布局组件：设置组件之间的间距。
class Space extends StatelessWidget {
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection? verticalDirection;
  final TextBaseline? textBaseline;
  final EdgeInsetsGeometry? padding;
  final double? size;
  final Axis? direction;
  final List<Widget>? children;

  const Space({
    super.key,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.crossAxisAlignment,
    this.textDirection,
    this.verticalDirection,
    this.textBaseline,
    this.padding,
    this.size,
    this.direction = Axis.horizontal,
    this.children = const <Widget>[],
  });

  SizedBox _space() {
    if (direction == Axis.vertical) {
      return SizedBox(
        height: size ?? DesignVariables.spaceDefault,
      );
    } else {
      return SizedBox(
        width: size ?? DesignVariables.spaceDefault,
      );
    }
  }

  Widget _layout() {
    if (children == null || children!.isEmpty) {
      return _space();
    }

    List<Widget> widgets = <Widget>[];
    for (int i = 0; i < children!.length; i++) {
      if (i == children!.length) {
        break;
      }
      widgets.add(children![i]);
      widgets.add(_space());
    }

    return direction == Axis.horizontal
        ? Row(
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
            mainAxisSize: mainAxisSize ?? MainAxisSize.max,
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
            textDirection: textDirection,
            verticalDirection: verticalDirection ?? VerticalDirection.down,
            textBaseline: textBaseline,
            children: widgets,
          )
        : Column(
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
            mainAxisSize: mainAxisSize ?? MainAxisSize.max,
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
            textDirection: textDirection,
            verticalDirection: verticalDirection ?? VerticalDirection.down,
            textBaseline: textBaseline,
            children: widgets,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: _layout(),
    );
  }
}

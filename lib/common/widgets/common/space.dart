import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection? verticalDirection;
  final TextBaseline? textBaseline;
  final EdgeInsetsGeometry? padding;
  final double size;
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
    required this.size,
    this.direction = Axis.horizontal,
    this.children = const <Widget>[],
  });

  SizedBox _space() {
    if (direction == Axis.vertical) {
      return SizedBox(
        height: size,
      );
    } else {
      return SizedBox(
        width: size,
      );
    }
  }

  Widget _layout() {
    if (children == null || children!.isEmpty) {
      return _space();
    }

    List<Widget> widgets = <Widget>[];
    for (int i = 0; i < children!.length; i++) {
      widgets.add(children![i]);
      if (i == children!.length - 1) {
        break;
      }
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

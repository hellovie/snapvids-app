import 'package:flutter/material.dart';

class GradientColor extends StatelessWidget {
  const GradientColor({
    super.key,
    required this.child,
    this.center = const Alignment(0, -0.4),
    this.radius = 0.6,
    this.colors,
    this.fillColor = Colors.white,
    this.stops,
    this.tileMode = TileMode.clamp,
    this.focal,
    this.focalRadius = 0.0,
    this.transform,
    this.opacity = 0.9,
    this.blendMode = BlendMode.srcATop,
  });

  final double opacity;
  final Widget child;
  final AlignmentGeometry center;
  final double radius;
  final List<Color>? colors;
  final Color fillColor;
  final List<double>? stops;
  final TileMode tileMode;
  final AlignmentGeometry? focal;
  final double focalRadius;
  final GradientTransform? transform;
  final BlendMode blendMode;

  @override
  Widget build(BuildContext context) {
    final HSLColor hsl = HSLColor.fromColor(fillColor);
    final Color darkerFillColor =
        hsl.withLightness((hsl.lightness * 0.9).clamp(0.0, 1.0)).toColor();
    List<Color> fillColors = [fillColor, fillColor, fillColor, darkerFillColor];

    return Opacity(
      opacity: opacity,
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return RadialGradient(
            center: center,
            radius: radius,
            colors: colors ?? fillColors,
            stops: stops,
            tileMode: tileMode,
            focal: focal,
            focalRadius: focalRadius,
            transform: transform,
          ).createShader(bounds);
        },
        blendMode: blendMode,
        child: child,
      ),
    );
  }
}

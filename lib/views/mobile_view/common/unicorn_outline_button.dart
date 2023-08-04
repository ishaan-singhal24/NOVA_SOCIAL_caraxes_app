import 'package:flutter/material.dart';
import 'package:nova_social/utils/utils.dart';

class UnicornOutlineButton extends StatelessWidget {
  final _GradientPainter _painter;
  final Widget child;
  final VoidCallback? onPressed;
  final double radius;
  final double strokeWidth;
  final double? width;
  final double? height;
  final Gradient? outlineGradient;
  final Color? outlineColor;
  final bool hasGradientBorder;

  UnicornOutlineButton.normalBorder({
    super.key,
    required this.strokeWidth,
    required this.radius,
    required this.child,
    this.width,
    this.height,
    required this.outlineColor,
    this.onPressed,
  })  : hasGradientBorder = false,
        outlineGradient = null,
        _painter = _GradientPainter(
          hasGradient: false,
          strokeWidth: strokeWidth,
          radius: radius,
          color: outlineColor,
          gradient: null,
        );

  UnicornOutlineButton.gradientBorder({
    super.key,
    required this.strokeWidth,
    required this.radius,
    required this.outlineGradient,
    required this.child,
    this.width,
    this.height,
    this.hasGradientBorder = true,
    this.onPressed,
  })  : outlineColor = null,
        _painter = _GradientPainter(
            hasGradient: true,
            strokeWidth: strokeWidth,
            radius: radius,
            gradient: outlineGradient,
            color: null);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onPressed,
        child: InkWell(
          borderRadius: BorderRadius.circular(radius),
          onTap: onPressed,
          child: Container(
            constraints: BoxConstraints(
              minWidth: width ?? 88,
              minHeight: height ?? 48,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double radius;
  final double strokeWidth;
  final Gradient? gradient;
  final Color? color;
  final bool hasGradient;

  _GradientPainter({
    required this.strokeWidth,
    required this.radius,
    required this.hasGradient,
    this.gradient,
    this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    Rect outerRect = Offset.zero & size;
    var outerRRect =
        RRect.fromRectAndRadius(outerRect, Radius.circular(radius));

    // create inner rectangle smaller by strokeWidth
    Rect innerRect = Rect.fromLTWH(strokeWidth, strokeWidth,
        size.width - strokeWidth * 2, size.height - strokeWidth * 2);
    var innerRRect = RRect.fromRectAndRadius(
        innerRect, Radius.circular(radius - strokeWidth));

    // apply gradient shader
    if (hasGradient && gradient != null) {
      _paint.shader = gradient!.createShader(outerRect);
    }

    if (hasGradient.not && color != null) {
      _paint.color = color!;
    }

    // create difference between outer and inner paths and draw it
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}

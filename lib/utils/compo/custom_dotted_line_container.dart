import 'dart:math';
import 'package:flutter/material.dart';

class DottedLineContainer extends StatelessWidget {
  final double width;
  final double height;
  final Widget? child;
  final Color borderColor;
  final Color backgroundColor;
  final double borderRadius;

  const DottedLineContainer({
    super.key,
    required this.width,
    required this.height,
    this.child,
    this.borderColor = Colors.black,
    this.backgroundColor = Colors.transparent,
    this.borderRadius = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedBorderPainter(
        color: borderColor,
        borderRadius: borderRadius,
      ),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  final Color color;
  final double borderRadius;

  DottedBorderPainter({
    required this.color,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const double dashWidth = 1;
    const double dashSpace = 3;
    final double radius = borderRadius;

    // Calculate points for the rounded rectangle
    final double topLeftX = 0;
    final double topLeftY = 0;
    final double topRightX = size.width;
    final double topRightY = 0;
    final double bottomRightX = size.width;
    final double bottomRightY = size.height;
    final double bottomLeftX = 0;
    final double bottomLeftY = size.height;

    // Draw top side
    _drawDottedLine(
      canvas,
      Offset(topLeftX + radius, topLeftY),
      Offset(topRightX - radius, topRightY),
      dashWidth,
      dashSpace,
      paint,
    );

    // Draw right side
    _drawDottedLine(
      canvas,
      Offset(bottomRightX, topRightY + radius),
      Offset(bottomRightX, bottomRightY - radius),
      dashWidth,
      dashSpace,
      paint,
    );

    // Draw bottom side
    _drawDottedLine(
      canvas,
      Offset(bottomRightX - radius, bottomRightY),
      Offset(bottomLeftX + radius, bottomRightY),
      dashWidth,
      dashSpace,
      paint,
    );

    // Draw left side
    _drawDottedLine(
      canvas,
      Offset(topLeftX, bottomLeftY - radius),
      Offset(topLeftX, topLeftY + radius),
      dashWidth,
      dashSpace,
      paint,
    );

    // Draw corners with dots
    _drawCornerDots(
      canvas,
      Offset(topLeftX + radius, topLeftY + radius),
      radius,
      180,
      270,
      dashWidth,
      dashSpace,
      paint,
    );

    _drawCornerDots(
      canvas,
      Offset(topRightX - radius, topRightY + radius),
      radius,
      270,
      360,
      dashWidth,
      dashSpace,
      paint,
    );

    _drawCornerDots(
      canvas,
      Offset(bottomRightX - radius, bottomRightY - radius),
      radius,
      0,
      90,
      dashWidth,
      dashSpace,
      paint,
    );

    _drawCornerDots(
      canvas,
      Offset(bottomLeftX + radius, bottomLeftY - radius),
      radius,
      90,
      180,
      dashWidth,
      dashSpace,
      paint,
    );
  }

  void _drawDottedLine(
    Canvas canvas,
    Offset start,
    Offset end,
    double dashWidth,
    double dashSpace,
    Paint paint,
  ) {
    final double dx = end.dx - start.dx;
    final double dy = end.dy - start.dy;
    final double distance = sqrt(dx * dx + dy * dy);
    final double step = dashWidth + dashSpace;
    final int count = (distance / step).floor();

    for (int i = 0; i < count; i++) {
      final double x = start.dx + dx * i * step / distance;
      final double y = start.dy + dy * i * step / distance;

      canvas.drawCircle(Offset(x, y), paint.strokeWidth / 2, paint);
    }
  }

  void _drawCornerDots(
    Canvas canvas,
    Offset center,
    double radius,
    double startAngle,
    double endAngle,
    double dotWidth,
    double dotSpace,
    Paint paint,
  ) {
    final double arcLength = radius * (endAngle - startAngle) * pi / 180;
    final double step = dotWidth + dotSpace;
    final int numberOfDots = (arcLength / step).floor();
    final double angleStep = (endAngle - startAngle) / numberOfDots;

    for (int i = 0; i <= numberOfDots; i++) {
      final double angle = (startAngle + i * angleStep) * pi / 180;
      final double x = center.dx + radius * cos(angle);
      final double y = center.dy + radius * sin(angle);

      canvas.drawCircle(Offset(x, y), paint.strokeWidth / 2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

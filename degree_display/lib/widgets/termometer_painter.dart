import 'package:degree_display/colors.dart';
import 'package:flutter/material.dart';

class ThermometerPainter extends CustomPainter {
  double waterAnimation;
  double sliderYPosition;

  ThermometerPainter({
    required this.waterAnimation,
    required this.sliderYPosition,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final numberToMultiply = waterAnimation - 0.5;

    Paint firstPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..shader = const LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [
          kBlue,
          kOrange,
          kRed,
        ],
      ).createShader(
        Rect.fromLTRB(0, 0, size.width, size.height),
      );

    Paint secondPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [
          kBlue.withOpacity(0.6),
          kOrange.withOpacity(0.6),
          kRed.withOpacity(0.6),
        ],
      ).createShader(
        Rect.fromLTRB(0, 0, size.width, size.height),
      );

    Path firstPath = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(
        size.width,
        sliderYPosition + 37.5,
      )
      ..quadraticBezierTo(
        size.width / waterAnimation * numberToMultiply,
        (sliderYPosition + 37.5) + 25,
        size.width / 2,
        sliderYPosition + 37.5,
      )
      ..quadraticBezierTo(
        size.width / waterAnimation,
        (sliderYPosition + 37.5) - 15,
        0,
        sliderYPosition + 37.5,
      );

    Path secondPath = Path()
      ..moveTo(0, size.height)
      ..lineTo(
        0,
        sliderYPosition + 37.5,
      )
      ..quadraticBezierTo(
        size.width / waterAnimation,
        (sliderYPosition + 37.5) + 25,
        size.width / 2,
        sliderYPosition + 37.5,
      )
      ..quadraticBezierTo(
        size.width / waterAnimation * numberToMultiply,
        (sliderYPosition + 37.5) - 15,
        size.width,
        sliderYPosition + 37.5,
      )
      ..lineTo(size.width, size.height);

    canvas.drawPath(firstPath, firstPaint);
    canvas.drawPath(secondPath, secondPaint);
  }

  @override
  bool shouldRepaint(ThermometerPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(ThermometerPainter oldDelegate) => false;
}

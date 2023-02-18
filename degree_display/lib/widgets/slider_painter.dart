import 'package:degree_display/colors.dart';
import 'package:flutter/material.dart';

class SliderPainter extends CustomPainter {
  double sliderYPosition;

  SliderPainter({
    required this.sliderYPosition,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
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

    Path path = Path()
      ..moveTo(75, -50)
      ..quadraticBezierTo(
        75,
        sliderYPosition - 37.5,
        30,
        sliderYPosition,
      )
      ..quadraticBezierTo(
        0,
        sliderYPosition + 37.5,
        30,
        sliderYPosition + 75,
      )
      ..quadraticBezierTo(
        75,
        sliderYPosition + 112.5,
        75,
        size.height + 50,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(SliderPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(SliderPainter oldDelegate) => false;
}

import 'package:flutter/material.dart';
import 'package:mouse_trailer/colors.dart';

class MouseTrailer1 extends StatefulWidget {
  const MouseTrailer1({super.key});

  @override
  State<MouseTrailer1> createState() => _MouseTrailer1State();
}

class _MouseTrailer1State extends State<MouseTrailer1> {
  List<Offset> mousePositions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MouseRegion(
        onHover: (event) {
          if (mousePositions.isEmpty) {
            setState(() {
              mousePositions.add(event.position);
            });
            return;
          }

          if (mousePositions.last.dx + 25 > event.position.dx ||
              mousePositions.last.dx - 25 < event.position.dx) {
            if (mousePositions.last.dy + 25 > event.position.dy ||
                mousePositions.last.dy - 25 < event.position.dy) {
              setState(() {
                mousePositions.add(event.position);
                if (mousePositions.length > 10) {
                  mousePositions.removeAt(0);
                }
              });
            }
          }

          print(event.position);
        },
        child: Stack(
          fit: StackFit.expand,
          children: mousePositions
              .map(
                (pos) => Positioned(
                  top: pos.dy - 12.5,
                  left: pos.dx - 12.5,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: kCadetGrey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

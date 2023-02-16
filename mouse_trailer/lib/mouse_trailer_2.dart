import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mouse_trailer/colors.dart';

class MouseTrailer2 extends StatefulWidget {
  const MouseTrailer2({super.key});

  @override
  State<MouseTrailer2> createState() => _MouseTrailer2State();
}

class _MouseTrailer2State extends State<MouseTrailer2> {
  late Timer timer;
  List<Offset> mousePositions = [
    Offset.zero,
    Offset.zero,
    Offset.zero,
    Offset.zero,
    Offset.zero,
  ];
  Offset currentMousePosition = Offset.zero;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(milliseconds: 10),
      (timer) {
        setState(() {
          mousePositions.removeAt(0);
          mousePositions.add(currentMousePosition);
        });
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MouseRegion(
        onHover: (event) {
          setState(() {
            currentMousePosition = event.position;
          });

          print(event.position);
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            for (int i = 0; i < mousePositions.length; i++)
              Positioned(
                top: mousePositions[i].dy - 12.5,
                left: mousePositions[i].dx - 12.5,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.accents[i],
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

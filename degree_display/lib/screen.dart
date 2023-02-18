import 'dart:ui';

import 'package:degree_display/colors.dart';
import 'package:degree_display/widgets/slider_painter.dart';
import 'package:degree_display/widgets/termometer_painter.dart';
import 'package:degree_display/widgets/weather_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> with SingleTickerProviderStateMixin {
  int degree = 20;
  double sliderYPosition = 0;

  final maxTemperatur = 40;

  late AnimationController animationController;
  late Animation waterAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    // animationController.addListener(() {
    //   print(animationController.value);
    //   print(animation.value);
    // });
    waterAnimation = Tween<double>(
      begin: 2,
      end: 8,
    ).animate(
      animationController,
    );

    animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.all(64.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      WeatherIndicator(
                        color: kRed,
                        icon: Icons.wb_sunny_rounded,
                        condition: degree >= 30,
                      ),
                      const SizedBox(width: 50),
                      WeatherIndicator(
                        color: kOrange,
                        icon: Icons.water_drop_rounded,
                        condition: degree < 30 && degree > 15,
                      ),
                      const SizedBox(width: 50),
                      WeatherIndicator(
                        color: kBlue,
                        icon: Icons.ac_unit_rounded,
                        condition: degree <= 15,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    "$degree°",
                    style: GoogleFonts.inter(
                      fontSize: 225,
                      fontWeight: FontWeight.w900,
                      color: kGrey,
                      height: 0.9,
                    ),
                  ),
                  Text(
                    "celsius",
                    style: GoogleFonts.inter(
                      fontSize: 64,
                      fontWeight: FontWeight.w500,
                      color: kGrey,
                      height: 0.9,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Container(
              width: 100,
              height: double.infinity,
              margin: const EdgeInsets.all(10),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 10,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
                borderRadius: BorderRadius.circular(180),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: AnimatedBuilder(
                        animation: animationController,
                        builder: (context, child) {
                          return CustomPaint(
                            painter: ThermometerPainter(
                              waterAnimation: waterAnimation.value,
                              sliderYPosition: sliderYPosition,
                            ),
                          );
                        }),
                  ),
                  Positioned.fill(
                    child: Image.asset(
                      "assets/glass texture.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 125,
              child: LayoutBuilder(
                builder: (context, constraints) => Stack(
                  children: [
                    Positioned.fill(
                      child: CustomPaint(
                        painter: SliderPainter(
                          sliderYPosition: sliderYPosition,
                        ),
                      ),
                    ),
                    Positioned(
                      top: sliderYPosition,
                      right: 0,
                      child: GestureDetector(
                        onVerticalDragUpdate: (details) {
                          setState(() {
                            sliderYPosition = clampDouble(
                              sliderYPosition + details.delta.dy,
                              0,
                              constraints.maxHeight - 75,
                            );

                            degree = (maxTemperatur *
                                    ((constraints.maxHeight - sliderYPosition - 37.5) /
                                        constraints.maxHeight))
                                .toInt();
                          });
                        },
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF141613),
                          ),
                          child: const Icon(
                            Icons.unfold_more_rounded,
                            color: Color(0xFF1E211C),
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

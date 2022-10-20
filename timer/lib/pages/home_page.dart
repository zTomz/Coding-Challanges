import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer/widgets/progress_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime currentTime = DateTime.now();

  @override
  void initState() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          currentTime = DateTime.now();
        });
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101119),
      body: currentTime.day == 5
          ? Center(
              child: Text(
                "Today is WEEKEND!",
                style: GoogleFonts.nunito().copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  height: 0.9,
                ),
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProgressField(
                  type: "Days",
                  value: (5 - currentTime.weekday).toString(),
                  progress: currentTime.weekday / 7,
                  gradientColors: const [
                    Color(0xFFFC9F5B),
                    Color(0xFFC73E1D),
                  ],
                ),
                ProgressField(
                  type: "Hours",
                  value: (24 - currentTime.hour).toString(),
                  progress: currentTime.hour / 24,
                  gradientColors: const [
                    Color(0xFF81E4DA),
                    Color(0xFF47E5BC),
                  ],
                ),
                ProgressField(
                  type: "Minutes",
                  value: (60 - currentTime.minute).toString(),
                  progress: currentTime.minute / 60,
                  gradientColors: const [
                    Color(0xFFF2E863),
                    Color(0xFFF2CD60),
                  ],
                ),
                ProgressField(
                  type: "Seconds",
                  value: (60 - currentTime.second).toString(),
                  progress: currentTime.second / 60,
                  gradientColors: const [
                    Color(0xFFA8D4AD),
                    Color(0xFF51A45A),
                  ],
                ),
              ],
            ),
    );
  }
}

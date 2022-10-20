import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressField extends StatelessWidget {
  const ProgressField({
    Key? key,
    required this.type,
    required this.value,
    required this.progress, required this.gradientColors,
  }) : super(key: key);

  final String type;
  final String value;
  final double progress;
  final List<Color> gradientColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            type,
            style: GoogleFonts.nunito().copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 50,
              height: 1.3,
            ),
          ),
          Text(
            "$value ${type.toLowerCase()} left",
            style: GoogleFonts.nunito().copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 100,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Container(
                width: (MediaQuery.of(context).size.width - 100) * progress,
                height: 40,
                decoration: BoxDecoration(
                  gradient:  LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: gradientColors,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

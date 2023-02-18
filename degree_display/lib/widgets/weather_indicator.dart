import 'package:flutter/material.dart';

class WeatherIndicator extends StatelessWidget {
  final Color color;
  final IconData icon;
  final bool condition;

  const WeatherIndicator({
    super.key,
    required this.color,
    required this.icon,
    required this.condition,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          if (condition)
            BoxShadow(
              color: color.withOpacity(0.7),
              spreadRadius: 20,
              blurRadius: 30,
            ),
        ],
      ),
      child: Icon(
        icon,
        size: 40,
        color: condition ? color : Colors.black,
      ),
    );
  }
}

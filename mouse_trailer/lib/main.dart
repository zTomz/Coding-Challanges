import 'package:flutter/material.dart';
import 'package:mouse_trailer/mouse_trailer_1.dart';
import 'package:mouse_trailer/mouse_trailer_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Mouse Trailer',
      home: MouseTrailer2(),
    );
  }
}

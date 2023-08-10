import 'package:creativespace/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:creativespace/responsive/mobile.dart';
import 'package:creativespace/responsive/web.dart';
import 'package:creativespace/splashscreens/splashWeb.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Creative Space',
      home: splashWeb(),
    );
  }
}

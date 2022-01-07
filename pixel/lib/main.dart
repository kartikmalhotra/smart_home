import 'package:flutter/material.dart';
import 'package:pixel/screens/home_screen.dart';

void main() {
  runApp(const PixelApp());
}

class PixelApp extends StatelessWidget {
  const PixelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pixel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: SafeArea(
          child: AppScreen(),
        ),
      ),
    );
  }
}

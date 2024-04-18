import 'package:flutter/material.dart';
import 'package:game_poo/welcome/welcome.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner : false,
      home: Scaffold(
        body: Welcome(),
        ),
      );
  }
}

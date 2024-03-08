import 'package:flutter/material.dart';

class LessonIntroPoo extends StatefulWidget {
  const LessonIntroPoo({super.key});

  @override
  State<LessonIntroPoo> createState() => _LessonIntroPooState();
}

class _LessonIntroPooState extends State<LessonIntroPoo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("lesson 1"),
      ),
    );
  }
}

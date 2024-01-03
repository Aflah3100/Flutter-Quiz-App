import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Quiz App',
        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
      )),
    );
  }
}

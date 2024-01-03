import 'package:flutter/material.dart';
import 'package:quiz_app/screens/homescreen.dart';

//Global Function
double getScreenHeight(BuildContext ctx){
  return MediaQuery.of(ctx).size.height;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      home: const ScreenHome(),
    );
  }
}

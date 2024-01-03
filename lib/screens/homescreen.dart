import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/screens/widgets/questionwidget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
        child: Text(
          'Quiz App',
          style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
        ),
      )),
      body: SafeArea(
          child: Column(
        children: [
          //Flag Image Container
          Container(
            width: double.infinity,
            height: getScreenHeight(context) * 0.28,
            margin: const EdgeInsets.all(8.0),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(13.0)),
            child: Image.asset('assets/images/flag.png'),
          ),
          SizedBox(height: getScreenHeight(context) * 0.03),
          //Question Display Container
           QuestionDisplay(),
          SizedBox(height: getScreenHeight(context) * 0.02),
          
        ],
      )),
    );
  }
}

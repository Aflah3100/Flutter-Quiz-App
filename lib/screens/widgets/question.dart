import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';

class QuestionDisplay extends StatelessWidget {
  const QuestionDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getScreenHeight(context) * 0.20,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: Colors.grey),
          borderRadius: BorderRadiusDirectional.circular(16.0)),
      child: const Column(
        children: [
          Text(
            'Question: ',
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 22.0,
                color: Color.fromARGB(255, 7, 255, 243)),
          ),
        ],
      ),
    );
  }
}

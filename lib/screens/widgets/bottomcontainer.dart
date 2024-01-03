import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getScreenHeight(context) * 0.30,
      margin: const EdgeInsets.all(5.0),
      //Bottom Container Column
      child: Column(
        children: [
          const SizedBox(
            height: 30.0,
          ),
          //Button Rows
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //True Button widget
              InkWell(
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 45, 46, 45),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: const Center(
                      child: Text(
                    'True',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              //False Button Widget
              InkWell(
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 45, 46, 45),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: const Center(
                      child: Text(
                    'False',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              //Next Question Button Widget
              InkWell(
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 45, 46, 45),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: const Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Next',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_right_sharp)
                    ],
                  )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

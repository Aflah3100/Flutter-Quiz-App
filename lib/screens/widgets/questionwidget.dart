import 'package:flutter/material.dart';
import 'package:quiz_app/db/functions/functions.dart';
import 'package:quiz_app/db/model/questionmodel.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/screens/widgets/bottomsheetwidget.dart';

// ignore: must_be_immutable
class QuestionDisplay extends StatefulWidget {
  const QuestionDisplay({super.key});

  @override
  State<QuestionDisplay> createState() => _QuestionDisplayState();
}

class _QuestionDisplayState extends State<QuestionDisplay> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    QuestionModel data = questionLists[currentIndex];
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: getScreenHeight(context) * 0.20,
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Colors.grey),
              borderRadius: BorderRadiusDirectional.circular(16.0)),
          child: Column(
            children: [
              const Text(
                'Question: ',
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 22.0,
                    color: Color.fromARGB(255, 7, 255, 243)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13.5, top: 33.0),
                child: Text(data.question,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Color.fromARGB(255, 233, 240, 239))),
              )
            ],
          ),
        ),
        //Bottom Container
        Container(
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
                    onTap: () {
                      if (data.answer) {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        showTrueSnackBar(context);
                      } else {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        showFalseSnackBar(context);
                      }
                    },
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
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  //False Button Widget
                  InkWell(
                    onTap: () {
                      if (!data.answer) {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        notShowFalseSnackBar(context, data.other!);
                      } else {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        notShowTrueSnackbar(context);
                      }
                    },
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
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  //Next Question Button Widget
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex =
                            (currentIndex + 1) % questionLists.length;
                      });
                    },
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
              ),
              const SizedBox(
                height: 35.0,
              ),
              //Add Question Button
              ElevatedButton(
                  onPressed: () {
                    showAddQuestionBottomSheet(context);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(const Color.fromARGB(255, 29, 153, 122)),
                  ),
                  child: const Text(
                    'Add Yours',
                    style: TextStyle(fontSize: 16.0,color: Colors.black),
                  ))
            ],
          ),
        )
      ],
    );
  }

  //Functions
  void showTrueSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 3),
      padding: EdgeInsets.all(12.0),
      content: Text('Yes! You made it Correct'),
      backgroundColor: Colors.green,
    ));
  }

  void showFalseSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 3),
      padding: EdgeInsets.all(12.0),
      content: Text('Oops! The Answer is Wrong! '),
      backgroundColor: Colors.red,
    ));
  }

  void notShowTrueSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 3),
      padding: EdgeInsets.all(12.0),
      content: Text('Oops! The Answer is Wrong! '),
      backgroundColor: Colors.red,
    ));
  }

  void notShowFalseSnackBar(BuildContext context, String info) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 5),
      padding: const EdgeInsets.all(12.0),
      content: ListTile(
        title: const Text('Yes! You made it Correct'),
        subtitle: Text(info,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      backgroundColor: Colors.green,
    ));
  }

  //Bottom Sheet Function

  void showAddQuestionBottomSheet(BuildContext context){
    showModalBottomSheet(context: context, 
    builder: (bottomSheetContext) => QuestionBottomSheet(bottomSheetContext: bottomSheetContext,),
    useSafeArea: true,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_app/db/functions/functions.dart';

// ignore: must_be_immutable
class QuestionBottomSheet extends StatelessWidget {
  BuildContext bottomSheetContext;
  QuestionBottomSheet({super.key, required this.bottomSheetContext});
  final _questionController = TextEditingController();
  final _answerController = TextEditingController();
  final _otherinfoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            //Question TextField
            TextFormField(
              controller: _questionController,
              decoration: InputDecoration(
                labelText: 'Question',
                hintText: 'Enter your Question',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.0)),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            TextFormField(
              controller: _answerController,
              decoration: InputDecoration(
                labelText: 'Answer',
                hintText: 'Enter True or False',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.0)),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            //Other Information Text Field
            TextFormField(
              controller: _otherinfoController,
              decoration: InputDecoration(
                labelText: 'Extra Info',
                hintText: 'Provide the correct information for false answers',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.0)),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    addToDatabase(
                        question: _questionController.text,
                        answer: _answerController.text);
                    fetchQuestions();
                    displayAlertBox(context);
                    _questionController.clear();
                    _answerController.clear();
                    _otherinfoController.clear();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green)),
                  child: const Text('Submit',
                      style: TextStyle(fontSize: 16.0, color: Colors.black)),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(bottomSheetContext).pop();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red)),
                  child: const Text('Cancel',
                      style: TextStyle(fontSize: 16.0, color: Colors.black)),
                )
              ],
            )
          ],
        ));
  }

  //Alert Box Function
  void displayAlertBox(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (alertBoxContext) {
          return  AlertDialog(title: const Text('Success'), 
          content: const Text('Question Added Succesfully'),
          actions: [
            TextButton(onPressed: (){
              Navigator.of(alertBoxContext).pop();
            }, child: const Text('Close'))
          ],);
        });
  }
}

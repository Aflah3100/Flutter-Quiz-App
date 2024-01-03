import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QuestionBottomSheet extends StatelessWidget {
  BuildContext bottomSheetContext;
  QuestionBottomSheet({super.key, required this.bottomSheetContext});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            //Question TextField
            TextFormField(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
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
}

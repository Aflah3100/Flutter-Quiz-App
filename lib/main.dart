import 'package:flutter/material.dart';
import 'package:quiz_app/db/model/questionmodel.dart';
import 'package:quiz_app/screens/homescreen.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quiz_app/screens/widgets/bottomsheetwidget.dart';

//Global Function
double getScreenHeight(BuildContext ctx){
  return MediaQuery.of(ctx).size.height;
}

void main() async{
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(QuestionModelAdapter().typeId)){
    Hive.registerAdapter(QuestionModelAdapter());
  }
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

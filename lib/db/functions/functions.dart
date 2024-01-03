import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quiz_app/db/model/questionmodel.dart';

//Question Lists
ValueNotifier<List<QuestionModel>> questionLists=ValueNotifier([
  QuestionModel(question: "The saffron color on the Indian flag represents courage and sacrifice", answer: true),
  QuestionModel(question: 'The white color on the Indian flag symbolizes peace and truth', answer: true),
  QuestionModel(question: 'The navy blue Ashoka Chakra on the Indian flag has 27 spokes.', answer: false,other: 'The navy blue Ashoka Chakra on the Indian flag has 24 spokes.'),
  QuestionModel(question: 'The design of the Indian flag was adopted on August 15, 1949.', answer: false,other: 'The design of the Indian flag was adopted on August 15, 1947.'),
  QuestionModel(question: 'The Ashoka Chakra on the Indian flag represents the Dharma Chakra, the wheel of law.', answer: true),
  QuestionModel(question: 'The Indian national flag was designed by Mahatma Gandhi.', answer: false,other: 'The Indian national flag was designed by Pingali Venkayya'),
  QuestionModel(question: 'The flag code of India specifies the proper usage and display of the national flag', answer: true)
]);

//Add Question to Database
void addToDatabase({required String question,required String answer})async{
  bool ans=(answer.toLowerCase()=='true')?true:false;
  QuestionModel userQuestion=QuestionModel(question: question, answer: ans);
  Box<QuestionModel> questiondb=await Hive.openBox<QuestionModel>('question-db');
  questiondb.add(userQuestion);
}

//fetch all questions in the database
void fetchQuestions()async{
  Box<QuestionModel> questiondb=await Hive.openBox<QuestionModel>('question-db');
  questionLists.value.addAll(questiondb.values.toList());
}

void removeAllData()async{
  Box<QuestionModel> questiondb=await Hive.openBox<QuestionModel>('question-db');
  questiondb.clear();
}

import 'package:hive_flutter/adapters.dart';
part 'questionmodel.g.dart';

@HiveType(typeId: 0)
class QuestionModel {
  @HiveField(0)
  late String question;
  @HiveField(1)
  late bool answer;
  @HiveField(2)
  String? other;
  QuestionModel({required this.question, required this.answer,this.other});
}

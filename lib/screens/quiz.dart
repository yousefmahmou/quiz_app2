import 'package:flutter/material.dart';
import 'package:quiz_app/screens/answer.dart';
import 'package:quiz_app/screens/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> _question;
  final int answerIndex;
  final Function(int x) answerQuestion;
  Quiz(this._question, this.answerIndex, this.answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(_question[answerIndex]['questionText'].toString()),
        ...(_question[answerIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(answer['text'].toString(),
              () => answerQuestion(int.parse(answer['score'].toString())));
        }).toList(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_app/screens/home_screen.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function() trueAnswer;
  Answer(this.answerText, this.trueAnswer);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: trueAnswer,
        child: Text(
          answerText,
          style: TextStyle(
            fontSize: 25,
            color: b,
          ),
        ),
      ),
    );
  }
}

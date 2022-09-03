import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz_app/screens/answer.dart';
import 'package:quiz_app/screens/question.dart';
import 'package:quiz_app/screens/quiz.dart';
import 'package:quiz_app/screens/result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Color w = Colors.white;
Color b = Colors.black;

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, Object>> _question = [
    {
      'questionText': 'What\'s Your Name?',
      'answers': [
        {'text': 'Ahmed', 'score': '10'},
        {'text': 'Moahmmed', 'score': '20'},
        {'text': 'Yousef', 'score': '30'},
      ]
    },
    {
      'questionText': 'What\'s Your Age?',
      'answers': [
        {'text': '10', 'score': '10'},
        {'text': '20', 'score': '20'},
        {'text': '15', 'score': '30'}
      ]
    },
    {
      'questionText': 'What\'s Your Nationality?',
      'answers': [
        {'text': 'Egyptian', 'score': '10'},
        {'text': 'Asuity', 'score': '20'},
        {'text': 'Aswany', 'score': '30'},
      ]
    },
  ];

  bool isSwitch = false;
  int answerIndex = 0;
  int totalScore = 0;
  void resetQuiz() {
    setState(() {
      answerIndex = 0;
      totalScore = 0;
    });
  }

  void answerQuestion(int score) {
    totalScore += score;
    setState(() {
      answerIndex += 1;
    });
    print(answerIndex);
    print(totalScore);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz App',
          style: TextStyle(
            color: b,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          Switch(
            value: isSwitch,
            onChanged: ((value) {
              setState(() {
                isSwitch = value;
                if (isSwitch == true) {
                  b = Colors.white;
                  w = Colors.black;
                }
                if (isSwitch == false) {
                  b = Colors.black;
                  w = Colors.white;
                }
              });
            }),
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.grey,
          ),
        ],
      ),
      body: Container(
        color: w,
        child: answerIndex < _question.length
            ? Quiz(_question, answerIndex, answerQuestion)
            : Result(resetQuiz, totalScore),
      ),
    );
  }
}

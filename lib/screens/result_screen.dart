import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz_app/screens/home_screen.dart';

class Result extends StatelessWidget {
  final Function() q;
  final int resultScore;
  Result(this.q, this.resultScore);
  String get resultPhrase {
    String? resultText;
    if (resultScore >= 70) {
      resultText = "you are amazing!";
    } else if (resultScore >= 40) {
      resultText = "nice!";
    } else {
      resultText = "you are bad!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "$resultScore",
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: b,
            ),
          ),
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: b,
            ),
          ),
          TextButton(
              onPressed: q,
              child: Text(
                'Return to Quiz',
                style: TextStyle(
                  fontSize: 30,
                  color: b,
                ),
              )),
        ],
      ),
    );
  }
}

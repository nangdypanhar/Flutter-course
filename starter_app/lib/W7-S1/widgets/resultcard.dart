import 'package:flutter/material.dart';
import 'package:starter_app/W7-S1/model/quiz.dart';
import 'package:starter_app/W7-S1/model/submission.dart';

class Resultcard extends StatelessWidget {
  final Question question;
  final int index;
  final Answer? answer;
  const Resultcard({
    super.key,
    required this.question,
    required this.answer,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return  Card(
    margin: const EdgeInsets.all(20),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: answer?.userAnswer == question.goodAnswer
                    ? Colors.green
                    : Colors.red,
                child: Text((index + 1).toString()),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  question.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: question.possibleAnswers
                  .map(
                    (possibleAnswer) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          question.goodAnswer == possibleAnswer
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 20,
                                )
                              : Container(width: 20),
                          const SizedBox(width: 10),
                          Text(
                            possibleAnswer,
                            style: TextStyle(
                              fontSize: 14,
                              color: possibleAnswer == answer?.userAnswer
                                  ? (possibleAnswer == question.goodAnswer
                                      ? Colors.green
                                      : Colors.red)
                                  : Colors.black,
                              fontWeight: possibleAnswer == answer?.userAnswer
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    ),
  );
  }
}

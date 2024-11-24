import 'package:flutter/material.dart';
import 'package:starter_app/W7-S1/model/quiz.dart';
import 'package:starter_app/W7-S1/model/submission.dart';
import 'package:starter_app/W7-S1/quiz_app.dart';
import 'package:starter_app/W7-S1/widgets/choice_button.dart';

class QuestionScreen extends StatefulWidget {
  final Function navigate;
  final Quiz quiz;
  final Submission submission;
  const QuestionScreen({
    super.key,
    required this.quiz,
    required this.navigate,
    required this.submission,
  });

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  Question get currentQuestion => widget.quiz.questions[_currentQuestionIndex];
  int _currentQuestionIndex = 0;

  void _nextQuestion(String answer) {
    widget.submission.addAnswer(currentQuestion, answer);
    setState(() {
      if (_currentQuestionIndex < widget.quiz.questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        widget.navigate(Screens.resultScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quiz.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              currentQuestion.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            ...currentQuestion.possibleAnswers.map(
              (q) => ChoiceButton(
                label: q,
                nextQuestion: () => _nextQuestion(q),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:starter_app/W7-S1/model/quiz.dart';

class Answer {
  final Question question;
  final String userAnswer;
  const Answer({required this.userAnswer, required this.question});

  bool isCorrect() {
    return question.goodAnswer == userAnswer;
  }

  @override
  String toString() {
    return userAnswer;
  }
}

class Submission {
  final Quiz quiz;
  final Map<Question, Answer> _answers = {};

  Submission({required this.quiz});
  Map<Question, Answer> get answers => _answers;

  int getScore() {
    int score = 0;
    for (var answer in _answers.values) {
      if (answer.isCorrect()) {
        score++;
      }
    }
    return score;
  }

  void addAnswer(Question question, String answer) {
    if (quiz.questions.contains(question)) {
      _answers[question] = Answer(userAnswer: answer, question: question);
    }
  }

  void removeAnswers() {
    _answers.clear();
  }

  Answer? getAnswerFor(Question question) {
    return _answers[question];
  }
}

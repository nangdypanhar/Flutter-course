import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starter_app/W7-S1/screens/question_screen.dart';
import 'package:starter_app/W7-S1/screens/result_screen.dart';
import 'package:starter_app/W7-S1/screens/welcome_screen.dart';
import 'model/quiz.dart';
import 'model/submission.dart';

Color appColor = Colors.blue[500]!;

enum Screens {
  resultScreen("result"),
  welcomeScreen("welcome"),
  questionScreen("question");

  final String label;

  const Screens(this.label);
  @override
  String toString() => label;
}

class QuizApp extends StatefulWidget {
  final Quiz quiz;
  const QuizApp(this.quiz, {super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  Screens currentScreen = Screens.welcomeScreen;
  late Submission submission;

  @override
  void initState() {
    super.initState();
    submission = Submission(quiz: widget.quiz);
  }

  void switchScreen(Screens screen) {
    setState(() {
      currentScreen = screen;
    });
  }

  Widget getScreen() {
    switch (currentScreen) {
      case Screens.resultScreen:
        return ResultScreen(
          submission: submission,
          navigate: switchScreen,
        );
      case Screens.questionScreen:
        return QuestionScreen(
          quiz: widget.quiz,
          navigate: switchScreen,
          submission: submission,
        );
      case Screens.welcomeScreen:
      default:
        return WelcomeScreen(navigate: switchScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: Scaffold(
        backgroundColor: appColor,
        body: getScreen(),
      ),
    );
  }
}

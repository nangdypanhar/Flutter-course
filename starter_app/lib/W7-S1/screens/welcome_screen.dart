import 'package:flutter/material.dart';
import 'package:starter_app/W7-S1/quiz_app.dart';
import 'package:starter_app/W7-S1/widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  final Function navigate;

  const WelcomeScreen({super.key, required this.navigate});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/quiz-logo.png',
            width: 250,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("Crazy Quizz",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w800,
              )),
          const SizedBox(
            height: 40,
          ),
          AppButton(
            "Start Quiz",
            onTap: () => navigate(Screens.questionScreen),
            icon: Icons.arrow_forward,
          )
        ],
      ),
    );
  }
}

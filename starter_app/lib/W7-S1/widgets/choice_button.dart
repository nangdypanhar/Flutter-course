import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final String label;
  final Function nextQuestion;
  const ChoiceButton(
      {super.key, required this.label, required this.nextQuestion});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => nextQuestion(),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[300],
        shadowColor: Colors.blueGrey,
        elevation: 2.0,
        fixedSize: const Size(250, 20),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

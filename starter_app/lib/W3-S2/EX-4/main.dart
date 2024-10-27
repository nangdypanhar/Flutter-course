import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final Color? color;
  final Gradient? gradient;
  const CustomCard({super.key, required this.text, this.color = Colors.blue})
      : gradient = null;
  const CustomCard.gradient({
    super.key,
    required this.text,
    required this.gradient,
  }) : color = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            decoration: TextDecoration.none,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Container(
        padding: const EdgeInsets.all(50),
        decoration: const BoxDecoration(
          color: Colors.white, // Use decoration to set color
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCard(text: "OOP", color: Colors.blue[100]),
            CustomCard(text: "FLUTTER", color: Colors.blue[300]),
            CustomCard.gradient(
                text: "FLUTTER",
                gradient: LinearGradient(
                    colors: [Colors.blue[300]!, Colors.blue[600]!])),
          ],
        )),
  ));
}

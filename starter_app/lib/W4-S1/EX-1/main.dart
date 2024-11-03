import 'package:flutter/material.dart';

class HobbieCard extends StatelessWidget {
  final String title;
  final Icon icon;
  final Color bgColor;
  const HobbieCard(
      {super.key,
      required this.title,
      required this.icon,
      this.bgColor = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            const SizedBox(width: 30),
            icon,
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("My Hobbies"),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HobbieCard(
                title: "Travelling",
                icon: Icon(
                  Icons.skateboarding,
                  color: Colors.white,
                )),
            HobbieCard(
              title: "Travelling",
              icon: Icon(
                Icons.skateboarding,
                color: Colors.white,
              ),
              bgColor: Colors.green,
            )
          ],
        ),
      ),
    )),
  );
}

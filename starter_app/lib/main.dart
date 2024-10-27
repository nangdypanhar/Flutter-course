import 'package:flutter/material.dart';

class GradiantButton extends StatelessWidget {
  String text;
  Color start;
  Color end;
  GradiantButton(this.text,
      {super.key, required this.start, required this.end});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          gradient: LinearGradient(colors: [start, end])),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 35, decoration: TextDecoration.none),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello world"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GradiantButton(
                "Hello1",
                start: const Color(0xff4E7DF5),
                end: const Color(0xff0B3CBD),
              ),
              const SizedBox(
                height: 10,
              ),
              GradiantButton(
                "Hello1",
                start: const Color(0xff4E7DF5),
                end: const Color(0xff0B3CBD),
              ),
              const SizedBox(
                height: 10,
              ),
              GradiantButton(
                "Hello1",
                start: const Color(0xff4E7DF5),
                end: const Color(0xff0B3CBD),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  final String title;
  const ProgressBar({super.key, required this.title});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  double width = 0;
  void increaseButton() {
    setState(() {
      width == 300 ? width : width += 20;
    });
  }

  void decreaseButton() {
    setState(() {
      width == 0 ? width : width -= 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 170,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: decreaseButton,
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: increaseButton,
                icon: const Icon(Icons.add),
              )
            ],
          ),
          Stack(
            children: [
              Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
              ),
              Container(
                width: width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.green,
          appBarTheme: const AppBarTheme(
            color: Colors.green,
          )),
      home: const Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProgressBar(title: "My Score In Flutter"),
                    ProgressBar(title: "My Score In Dart"),
                    ProgressBar(title: "My Score In React"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

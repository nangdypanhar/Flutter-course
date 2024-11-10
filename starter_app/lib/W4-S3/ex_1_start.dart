import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  String text = "Not Selected";
  int colorNumber = 50;
  Color textColor = Colors.black;

  void _onPressed() {
    setState(() {
      if (text == "Not Selected") {
        colorNumber = 500;
        text = "Selected";
        textColor = Colors.white;
      } else {
        colorNumber = 50;
        text = "Not Selected";
        textColor = Colors.black;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        height: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[colorNumber]),
          onPressed: _onPressed,
          child: Center(
              child: Text(
            text,
            style: TextStyle(
              color: textColor,
            ),
          )),
        ));
  }
}

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(),
              CustomButton(),
              CustomButton(),
              CustomButton()
            ],
          ),
        ),
      ),
    ));

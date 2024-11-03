import 'package:flutter/material.dart';

enum ButtonType {
  primary(Colors.blue),
  secondary(Colors.green),
  disable(Colors.grey);

  final Color color;
  const ButtonType(this.color);

  @override
  String toString() => color.toString();
}

enum IconPosition {
  right("right"),
  left("left");

  final String label;
  const IconPosition(this.label);

  @override
  String toString() => label;
}

class CustomButton extends StatelessWidget {
  final String title;
  final Icon icon;
  final ButtonType buttonType;
  final IconPosition iconPosition;

  const CustomButton({
    super.key,
    required this.title,
    required this.icon,
    this.buttonType = ButtonType.primary,
    this.iconPosition = IconPosition.left,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(backgroundColor: buttonType.color),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconPosition == IconPosition.left) icon,
          Text(title),
          if (iconPosition == IconPosition.right) icon,
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Products",
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomButton(
              title: "Hello ",
              icon: Icon(Icons.delete),
              iconPosition: IconPosition.right,
            ),
            CustomButton(
              title: "Hello ",
              icon: Icon(Icons.delete),
              iconPosition: IconPosition.right,
            ),
            CustomButton(
              title: "Hello ",
              icon: Icon(Icons.delete),
              iconPosition: IconPosition.left,
            )
          ],
        ),
      ),
    )),
  );
}

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Container(
    padding: const EdgeInsets.all(50),
    margin: const EdgeInsets.all(40),
    color: Colors.blue[300],
    child: Container(
      decoration: BoxDecoration(
        color: Colors.blue[600],
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: Text(
          "CADT STUDENTS",
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    ),
  )));
}

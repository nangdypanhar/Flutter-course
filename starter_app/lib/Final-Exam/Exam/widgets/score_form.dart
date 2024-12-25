import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:starter_app/Exam/Models/course.dart';

class ScoreForm extends StatefulWidget {
  const ScoreForm({super.key});

  @override
  State<ScoreForm> createState() => _ScoreFormState();
}

class _ScoreFormState extends State<ScoreForm> {
  final _formKey = GlobalKey<FormState>();
  String _enterName = '';
  double _enterScore = 0;

  void addScore() {
    bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      StudentScore newStudent = StudentScore(
        score: _enterScore,
        name: _enterName,
      );

      Navigator.pop(context, newStudent);
    }
  }

  String? validateTitle(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.trim().length <= 1 ||
        value.trim().length > 50) {
      return 'Must be between 1 and 50 characters.';
    }
    return null;
  }

  String? validateQuantity(String? value) {
    _enterScore = double.tryParse(value!) ?? 0;
    if (_enterScore <= 0) {
      return 'Must be a valid, positive number.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Add Score "),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Name "),
                ),
                onChanged: (value) {
                  _enterName = value;
                },
                maxLength: 50,
                validator: validateTitle,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: validateQuantity,
                decoration: const InputDecoration(
                  label: Text("Score : "),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: addScore,
                  child: const Text("Add Score"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

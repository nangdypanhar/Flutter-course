import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const Temperature());
}

class Temperature extends StatefulWidget {
  const Temperature({super.key});

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  final TextEditingController degreeController = TextEditingController();
  String textInput = '';

  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  final InputDecoration inputDecoration = InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 1.0),
        borderRadius: BorderRadius.circular(12),
      ),
      hintText: 'Enter a temperature',
      hintStyle: const TextStyle(color: Colors.white));

  void convertToFa(String val) {
    if (val.isEmpty) {
      setState(() {
        textInput = '0';
      });
      return;
    }

    try {
      double degree = double.parse(val);
      double fahrenheit = (degree * 9 / 5) + 32;
      setState(() {
        textInput =
            fahrenheit.toStringAsFixed(2); 
      });
    } catch (e) {
      setState(() {
        textInput = 'Invalid input';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.green,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.thermostat_outlined,
              size: 120,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 45),
              ),
            ),
            const SizedBox(height: 50),
            const Text("Temperature in Degrees:"),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: inputDecoration,
              style: const TextStyle(color: Colors.white),
              onChanged: (val) {
                convertToFa(val);
              },
            ),
            const SizedBox(height: 30),
            const Text("Temperature in Fahrenheit:"),
            const SizedBox(height: 10),
            Container(
                padding: const EdgeInsets.all(10),
                decoration: textDecoration,
                child: Text(textInput))
          ],
        )),
      ),
    ));
  }
}

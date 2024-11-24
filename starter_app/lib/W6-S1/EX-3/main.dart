import 'package:flutter/material.dart';
import 'package:starter_app/W6-S1/EX-3/screen/temperature.dart';
import 'package:starter_app/W6-S1/EX-3/screen/welcome.dart';


class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  bool isSwitch = false;
  void switchScreen(){
    setState(() {
      isSwitch = !isSwitch;
    });
  }
  @override
  Widget build(context) {

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child:  isSwitch ? Temperature() :  Welcome(navigate: switchScreen,),
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}

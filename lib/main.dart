import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      home: BmiCalculator(),
    );
  }
}
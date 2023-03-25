import 'package:bmi_calculator/shared/colors.dart';
import 'package:bmi_calculator/shared/text_in_result_screen.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {

  final double result;
  final bool isMale;
  final int age;
  final int weight;
  final double height;
  String get resultPhrase{
    String resultText;
    if(result < 18.5)
      resultText = 'UnderWeight';
    else if(result >= 18.5 && result <= 24.9)
      resultText = 'Normal';
    else if(result >= 25 && result <= 29.9)
      resultText = 'Overweight';
    else
      resultText = 'Obese';
    return resultText;
  }

  ResultScreen({
    required this.isMale ,
    required this.age ,
    required this.height,
    required this.weight,
    required this.result
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey900,
      appBar: AppBar(
        backgroundColor: greenColor30,
        centerTitle: true,
        title: const Text(
          'Result'
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Card(
            color: greenColor30,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0 , horizontal: 60),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildTextInResultScreen('State: $resultPhrase'),
                  buildTextInResultScreen('Result: ${result.toStringAsFixed(2)}'),
                  buildTextInResultScreen('Gender: ${isMale? 'Male' : 'Female'}'),
                  buildTextInResultScreen('Age: $age'),
                  buildTextInResultScreen('Weight: $weight'),
                  buildTextInResultScreen('Height: $height'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

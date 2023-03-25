import 'package:bmi_calculator/shared/colors.dart';
import 'package:flutter/material.dart';

Widget buildTextInResultScreen(String text){
  return Padding(
    padding: const EdgeInsets.only(bottom: 6.0),
    child: Text(
      text,
      style: TextStyle(
        color: whiteColorFf,
        fontSize: 24,
        fontWeight: FontWeight.w500
      ),
    ),
  );
}
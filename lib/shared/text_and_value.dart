import 'package:bmi_calculator/shared/colors.dart';
import 'package:bmi_calculator/shared/shared_text.dart';
import 'package:flutter/material.dart';

Widget buildTextAndValue(String text , int value){
  return Column(
    children: [
      buildTextShared(text),
      Text(
        '$value',
        style: TextStyle(
          fontSize: 46,
          fontWeight: FontWeight.w700,
          color: whiteColorFf,
        ),
      )
    ],
  );
}
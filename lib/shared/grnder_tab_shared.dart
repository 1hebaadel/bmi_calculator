import 'package:bmi_calculator/shared/colors.dart';
import 'package:bmi_calculator/shared/sharedIcon.dart';
import 'package:bmi_calculator/shared/shared_text.dart';
import 'package:flutter/material.dart';

Widget buildGenderTab(String textGender , IconData icon , Color color){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Column(
        children: [
          buildIconShared(icon),
          buildTextShared(textGender),
        ],
      ),
    ),
  );
}
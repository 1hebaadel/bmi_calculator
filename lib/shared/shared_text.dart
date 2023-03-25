import 'package:flutter/material.dart';

import 'colors.dart';

Widget buildTextShared(String text){
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
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
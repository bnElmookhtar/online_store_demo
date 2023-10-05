import 'package:flutter/material.dart';

Widget defText({
  required String txt,
  required double fontSize,
  TextAlign txtAlign = TextAlign.start,
  FontWeight fontWeight = FontWeight.normal,
  Color txtColor = Colors.white,
}) =>
    Text(
      txt,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight,color: txtColor),
      textAlign: txtAlign,
    );
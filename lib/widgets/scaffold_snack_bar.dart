import 'package:flutter/material.dart';
import 'package:online_store/widgets/colors.dart';
import 'package:online_store/widgets/default_txt.dart';
SnackBar scaffoldSnackBar({required String msg,int durationTime = 700})=>SnackBar(
    content: Container(
      margin: EdgeInsetsDirectional.all(20),
      padding: EdgeInsetsDirectional.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: pink,
      ),
      child: Center(
        child: defText(txt: msg, fontSize: 22,txtAlign: TextAlign.center),
      ),
    ),
  duration: Duration(milliseconds: durationTime),
  elevation: 0,
  backgroundColor: gray.withOpacity(0),
);
import 'package:flutter/material.dart';
import 'colors.dart';
import 'default_txt.dart';
Widget defListTile(
        {
          required onTap,
          required String title,
          required IconData iconData
        }) =>
    Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: pink,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        onTap: onTap,
        title: defText(
          txt: title,
          fontSize: 24,
          txtAlign: TextAlign.center
        ),
        leading: Icon(iconData,color: white,),
      ),
    );

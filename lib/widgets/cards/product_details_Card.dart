import 'package:flutter/material.dart';

import '../colors.dart';
import '../default_txt.dart';
Widget productDetails({
  required context,
  required String imagePath,
  required String title,
  required String description,
  required String category,
  required double price,
}) =>
    Padding(
      padding:
      const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsetsDirectional.symmetric(
                horizontal: 128, vertical: 8),
            width: MediaQuery.of(context).size.width * 4,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(imagePath),
                  fit: BoxFit.cover,
                )),
          ),
          const Spacer(),
          defText(
              txt: title,
              fontSize: 24,
              txtAlign: TextAlign.center,
              txtColor: pink,
              fontWeight: FontWeight.bold),
          defText(
              txt: 'description: $description',
              fontSize: 16,
              txtColor: pink,
              txtAlign: TextAlign.justify),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              defText(txt: 'category: $category', fontSize: 24,txtColor: pink),
              defText(txt: 'Price : $price L.E', fontSize: 24,txtColor: pink)
            ],
          )
        ],
      ),
    );
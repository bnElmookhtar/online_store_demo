import 'package:flutter/material.dart';

import '../colors.dart';
import '../default_txt.dart';

Widget showCartItems(
    {required context,
      required String imagePath,
      required String title,
      required String description,
      required String category,
      required onDeleteIconPressed}) =>
    Container(
      margin: EdgeInsetsDirectional.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: pink,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(imagePath),
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.3,
            margin: const EdgeInsetsDirectional.symmetric(
                horizontal: 8, vertical: 8),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: defText(
                        txt: title, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    flex: 6,
                    child: defText(
                        txt: description,
                        fontSize: 12,
                        txtAlign: TextAlign.justify),
                  ),
                  Expanded(
                      flex: 1,
                      child: defText(
                          txt: category,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ]),
          ),
          IconButton(
              onPressed: onDeleteIconPressed,
              icon: Icon(
                Icons.delete,
                color: white,
              )),
        ],
      ),
    );
import 'package:flutter/material.dart';

import '../colors.dart';
import '../default_txt.dart';

Widget showFavoriteItem(
    {required context,
      required String imagePath,
      required String title,
      required String description,
      required String category,
      required onDeleteIconPressed}) =>
    Container(
      margin: EdgeInsetsDirectional.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: pink,
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
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.3,
            margin: const EdgeInsetsDirectional.symmetric(
                horizontal: 8, vertical: 8),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: defText(
                        txt: title, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: defText(
                        txt: description,
                        fontSize: 14,
                        txtAlign: TextAlign.justify),
                  ),
                  Expanded(
                      child: defText(
                          txt: category,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ]),
          ),
          IconButton(
              onPressed: onDeleteIconPressed,
              icon:  Icon(
                Icons.delete,
                color: white,
              )),
        ],
      ),
    );
import 'package:flutter/material.dart';
import 'package:online_store/widgets/colors.dart';

import '../default_txt.dart';
Widget topViewProduct(
    {required context,
      required imgPath,
      required price,
      required String title,
      required int rating}) =>
    Container(
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: pink),
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(imgPath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 4, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                defText(txt: "$price : L.E", fontSize: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: List.generate(
                    rating,
                        (index) =>  Icon(

                      Icons.star_border_outlined,
                      size: 16,
                      color: white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:EdgeInsetsDirectional.symmetric(horizontal: 4),
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              style:  TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: white
              ),
            ),
          ),
        ],
      ),
    );
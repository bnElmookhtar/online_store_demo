import 'package:flutter/material.dart';

import '../colors.dart';
import '../default_txt.dart';
Widget gridViewProduct({
  required context,
  required imgPath,
  required price,
  required isFavorite,
  required onFavoriteIconPressed,
  required onProductCardPressd,
  required onProductCartPressd,
  required String title,
  required rating,
}) =>
    MaterialButton(
      onPressed: onProductCardPressd,
      child: Container(
        margin: const EdgeInsetsDirectional.symmetric(horizontal: 4, vertical: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: pink,
        ),
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.4,
                  height: MediaQuery.of(context).size.height * 0.23,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(imgPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Center(
                      child: IconButton(
                        onPressed: onFavoriteIconPressed,
                        icon: CircleAvatar(
                          radius: 30,
                          backgroundColor: pink,
                          child: isFavorite
                              ? const Icon(
                            Icons.star,
                            color: Colors.white,
                          )
                              : const Icon(
                            Icons.star_border,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Center(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: red,
                      child: IconButton(
                        onPressed: onProductCartPressd,
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 4, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  defText(txt: "$price : L.E", fontSize: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: List.generate(
                      rating,
                          (index) => Icon(
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
              padding: const  EdgeInsetsDirectional.symmetric(horizontal: 4),
              child: Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
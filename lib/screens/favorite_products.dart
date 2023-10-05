import 'package:flutter/material.dart';
import 'package:online_store/widgets/colors.dart';
import 'package:online_store/widgets/scaffold_snack_bar.dart';
import 'package:provider/provider.dart';

import '../state_managment/provider.dart';
import '../widgets/default_txt.dart';
import '../widgets/cards/favorite_product_card.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StoreStates>(context);
    return Scaffold(
        appBar: AppBar(
          title: defText(
              txt: "Favorites Products",
              fontSize: 32,
              fontWeight: FontWeight.bold,
              txtColor: pink),
        ),
        body: provider.favorites.length == 0
            ?  Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 50,vertical: 200),
              child: Column(
                      children: [
                        CircularProgressIndicator(
                         color: pink,
                       ),
                        const Spacer(),
                        defText(
                            txt:
                                "There is no favorites product to show go to home and select favorite product ",
                            fontSize: 18,
                            txtColor: pink,
                          txtAlign: TextAlign.center
                        )
                      ],
        ),
            )
            : ListView.separated(
                itemBuilder: (context, index) =>
                showFavoriteItem(
                        context: context,
                        imagePath: provider.favorites[index].image!,
                        title: provider.favorites[index].title!,
                        description: provider.favorites[index].description!,
                        category: provider.favorites[index].category!,
                        onDeleteIconPressed: () {
                          provider.deleteProductFromFavorites(
                              product: provider.favorites[index]);
                          ScaffoldMessenger.of(context).showSnackBar(
                            scaffoldSnackBar(msg: "delete item successfully from favorites")
                          );
                        }),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: provider.favorites.length));
  }
}

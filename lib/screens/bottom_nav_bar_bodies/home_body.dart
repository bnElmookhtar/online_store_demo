import 'package:flutter/material.dart';
import 'package:online_store/widgets/colors.dart';
import 'package:online_store/widgets/scaffold_snack_bar.dart';
import 'package:provider/provider.dart';
import '../../state_managment/provider.dart';
import '../../widgets/cards/grid_view_product_card.dart';
import '../../widgets/cards/top_view_product_card.dart';
import '../product_detailes.dart';
class HomeBody extends StatefulWidget {
  const HomeBody({super.key});
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<StoreStates>(context);
    provider.gettingData();
    return provider.returnedProducts.length == 0
        ? Center(child: CircularProgressIndicator(color: pink,))
        : Column(
            children: [
              Container(
                margin: const EdgeInsetsDirectional.symmetric(
                    horizontal: 16, vertical: 8),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => topViewProduct(
                          rating: 4,
                          title: provider.returnedProducts[6 + index].title!,
                          context: context,
                          imgPath: provider.returnedProducts[6 + index].image,
                          price: provider.returnedProducts[6 + index].price,
                        ),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: 8),
              ),
              Container(
                  margin: const EdgeInsetsDirectional.symmetric(horizontal: 16),
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(
                      provider.returnedProducts.length,
                      (index) => gridViewProduct(
                          rating: 4,
                          context: context,
                          imgPath: provider.returnedProducts[index].image,
                          price: provider.returnedProducts[index].price,
                          isFavorite: false,
                          onFavoriteIconPressed: () {
                            provider.addProductToFavorites(
                                product: provider.returnedProducts[index]);
                            provider.returnedProducts[index].isFavorite = false;
                            ScaffoldMessenger.of(context).showSnackBar(
                                scaffoldSnackBar(msg: provider.scaffoldMsg));
                          },
                          title: provider.returnedProducts[index].title!,
                          onProductCardPressd: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => ProductDetails(
                                        product:
                                            provider.returnedProducts[index])));
                          },
                          onProductCartPressd: () {
                            provider.addProductToCart(
                                product: provider.returnedProducts[index]);
                            ScaffoldMessenger.of(context).showSnackBar(
                                scaffoldSnackBar(msg: provider.scaffoldMsg));
                          }),
                    ),
                  ))
            ],
          );
  }
}

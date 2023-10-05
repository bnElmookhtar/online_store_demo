import 'package:flutter/material.dart';
import 'package:online_store/widgets/scaffold_snack_bar.dart';
import 'package:provider/provider.dart';
import '../../models/product_model.dart';
import '../../widgets/cards/cart_product_card.dart';
import '../../widgets/colors.dart';
import '../../state_managment/provider.dart';
import '../../widgets/default_txt.dart';

List<ProductModel> returnedProducts = [];

class CartBody extends StatefulWidget {
  const CartBody({super.key});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StoreStates>(context);

    return provider.cartProducts.length==0?Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 50,vertical: 200),
      child: Center(
        child: Column(

          children: [
            CircularProgressIndicator(
              color: pink,
            ),
            const Spacer(),
            defText(
                txt:
                "There is no products in your cart yet ",
                fontSize: 18,
                txtColor: pink,
                txtAlign: TextAlign.center
            )
          ],
        ),
      ),
    ):
      ListView.separated(
        itemBuilder: (context, index) => showCartItems(
            context: context,
            imagePath: provider.cartProducts[index].image!,
            title: provider.cartProducts[index].title!,
            description: provider.cartProducts[index].description!,
            category: provider.cartProducts[index].category!,
            onDeleteIconPressed: () {
              provider.deleteCartProduct(product: provider.cartProducts[index]);
              ScaffoldMessenger.of(context).showSnackBar(scaffoldSnackBar(msg: "Product deleted successfully your your cart"));
            }),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: provider.cartProducts.length);
  }
}

import 'package:flutter/material.dart';
import 'package:online_store/models/product_model.dart';
import 'package:online_store/widgets/colors.dart';

import '../widgets/default_txt.dart';
import '../widgets/cards/product_details_Card.dart';
class ProductDetails extends StatelessWidget {
  final ProductModel product;
  const ProductDetails({super.key, required this.product});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title:defText(txt: "Product Details", fontSize: 24,fontWeight: FontWeight.bold,txtColor: pink),
        ),
        body: productDetails(
          context: context,
          imagePath: product.image!,
          title: product.title!,
          description: product.description!,
          category: product.category!,
          price: product.price!,
        ));
  }
}

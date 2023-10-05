import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:online_store/models/product_model.dart';
import 'package:http/http.dart' as http;

class StoreStates extends ChangeNotifier {

  List<ProductModel> favorites = [];
  List<ProductModel> cartProducts = [];
  List<ProductModel> returnedProducts = [];
  double totalPrice = 0;
  String scaffoldMsg = "Item added to favorites successfully";
  bool isDark = false;

  addProductToFavorites({required ProductModel product}) {
    if (favorites.contains(product)) {
      scaffoldMsg = "Item Exist";
    } else {
      scaffoldMsg = "Item added successfully";
      favorites.add(product);
    }
    notifyListeners();
  }

  deleteProductFromFavorites({required product}) {
    favorites.remove(product);
    scaffoldMsg = "Item Deleted from favorites successfully ";
    notifyListeners();
  }

  addProductToCart({required ProductModel product}) {
    if (cartProducts.contains(product)) {
      scaffoldMsg = "Item Exist";
    } else {
      scaffoldMsg = "Item added to cart successfully";
      cartProducts.add(product);
    }
    notifyListeners();
  }

  deleteCartProduct({required product}) {
    cartProducts.remove(product);
    scaffoldMsg = "Item removed rom cart  successfully ";
    notifyListeners();
  }

  Future gettingData() async {
    List<ProductModel> products = [];
    http.Response response =
    await http.get(Uri.parse("https://fakestoreapi.com/products"));
    var responseBody = jsonDecode(response.body);
    for (var elemnt in responseBody) {
      products.add(ProductModel.jsonMap(elemnt, false));
    }
      returnedProducts = products;
    notifyListeners();
  }

  changeMode(){
    isDark = !isDark;
    notifyListeners();
  }
}

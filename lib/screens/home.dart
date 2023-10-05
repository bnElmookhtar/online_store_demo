import 'dart:math';
import 'package:flutter/material.dart';
import 'package:online_store/screens/favorite_products.dart';
import 'package:online_store/state_managment/provider.dart';
import 'package:online_store/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';
import '../widgets/colors.dart';
import '../widgets/default_txt.dart';
import 'bottom_nav_bar_bodies/cart_body.dart';
import 'bottom_nav_bar_bodies/home_body.dart';

List<ProductModel> returnedProducts = [];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Random randomItems = Random();
  List<Widget> bodies  =const [
    HomeBody(),
    CartBody(),
  ];
  List<String> pagesTitles = [
    "Online Store",
    "Your Cart",
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StoreStates>(context);
    provider.gettingData();
    returnedProducts= provider.returnedProducts;
    return Scaffold(
      appBar: AppBar(
        title: defText(
            txt: pagesTitles[_currentIndex], fontSize: 32, fontWeight: FontWeight.bold,txtColor: pink),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (builder) => const Favorites()));
            },
            icon: const Icon(Icons.star_border),
          )
        ],
      ),
      drawer: SafeArea(
        child: AppDrawer(context: context),
      ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index){
          setState(() {
            _currentIndex  = index;
          });
        },
        currentIndex:_currentIndex,
        elevation: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Your Cart"),
        ],
      ),
      body:bodies[_currentIndex],
    );
  }
}

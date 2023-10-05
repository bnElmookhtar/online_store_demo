import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_store/screens/home.dart';
import 'package:online_store/widgets/colors.dart';
import 'package:online_store/state_managment/provider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(ChangeNotifierProvider(create: (context)=>StoreStates(),child: const OnlineStore(),));
}

class OnlineStore extends StatelessWidget {
  const OnlineStore({super.key});
  @override
  Widget build(BuildContext context) {
   // final provider = Provider.of<StoreStates>(context);
    return  MaterialApp(
      theme:ThemeData(
        scaffoldBackgroundColor: gray,
        appBarTheme: AppBarTheme(
          color: gray,
          elevation: 0,
          centerTitle: true,
          foregroundColor: pink,
        ),
        
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: gray,
          elevation: 0,
          selectedIconTheme: IconThemeData(
            color: pink,
            size: 30,
          ),
          selectedLabelStyle: TextStyle(
            color: white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        )
      ),
darkTheme:ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0,
          centerTitle: true,
          foregroundColor: white,
        ),

        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          elevation: 0,
          selectedIconTheme: IconThemeData(
            color: pink,
            size: 30,
          ),
          selectedLabelStyle: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        )
    ),
      themeMode: StoreStates().isDark?ThemeMode.dark:ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}


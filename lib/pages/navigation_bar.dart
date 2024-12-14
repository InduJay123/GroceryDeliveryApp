import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:food_delivery_app/pages/home/main_grocery_page.dart';
import 'package:food_delivery_app/pages/profile.dart';
import 'package:food_delivery_app/utils/colors.dart';

import 'cart/cart_screen.dart';
import 'favourite_page.dart';
import 'history.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key,t});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int _currentIndex =0;
  final List<Widget> _pages = [
    const MainFoodPage(),
    CartScreen(),
    const FavouritePage(),
    Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: mainColor,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favourites",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
        body: _pages[_currentIndex],
      ),
    );
  }
}

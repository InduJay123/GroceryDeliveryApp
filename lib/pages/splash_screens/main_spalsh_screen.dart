import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/cards/recommended_product_card.dart';
import 'package:food_delivery_app/pages/authentication/auth_screen.dart';
import 'package:food_delivery_app/pages/cart/cart_screen.dart';
import 'package:food_delivery_app/pages/grocery/popular_grocery_details.dart';
import 'package:food_delivery_app/pages/home/main_grocery_page.dart';
import 'package:food_delivery_app/pages/navigation_bar.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/wrapper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTimer(){
    Timer(const Duration(seconds: 10),() async {
      Navigator.push(context, MaterialPageRoute(builder: (c) => Wrapper()));
    });
  }

  @override
  void initState(){
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(3),
                child: Image.asset('assets/splash/img1.webp',
                height: 350,),
              ),
              SizedBox(height: 10,),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "QuickMart",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 45,
                    fontFamily: 'Lobster'
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

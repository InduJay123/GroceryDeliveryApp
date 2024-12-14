import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:food_delivery_app/providers/add_to_cart_provider.dart';
import 'package:food_delivery_app/utils/colors.dart';

import '../../data/product_data.dart';
import 'check_out.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finalList = provider.cart;
    productQuantity(IconData icon, int index){
      return GestureDetector(
        onTap: () {
          setState(() {
            icon == Icons.add ? provider.incrementQtn(index) : provider.decrementQtn(index);
          });
        },
        child: Icon(icon, size: 20,),
      );
    }
    return Scaffold(
      //backgroundColor: mainColor,
      bottomSheet: CheckOutBox(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(8)
                    ),
                      onPressed: (){},
                      icon: const Icon(Icons.arrow_back_ios,
                      ),
                  ),
                  const Text(
                    'My Cart',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                    ),
                  ),
                  SizedBox(),
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                itemCount: finalList.length,
                itemBuilder: (context, index){
                  final cartItems = finalList[index];
                  return Stack(
                    children: [
                      Padding(
                          padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.01),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: buttonBackgroundColor
                            ),
                            padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.015),
                            child: Row(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height*0.1,
                                  width: MediaQuery.of(context).size.width*0.25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white
                                  ),
                                  padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.01),
                                  child: Image.asset(cartItems.img),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Text(
                                    cartItems.name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                  Text(
                                    cartItems.description,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: signColor
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                  Text(
                                    '\$${cartItems.price}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
                                    ),
                                  ),
                                ],)
                              ],
                            ),
                          ),
                      ),
                      Positioned(
                          top:MediaQuery.of(context).size.height*0.02,
                           right: MediaQuery.of(context).size.width*0.02,
                          //bottom:MediaQuery.of(context).size.height*0.03,
                          child: Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    finalList.removeAt(index);
                                    setState(() {

                                    });
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red
                                  ),
                              ),
                              //for item Quantity
                              SizedBox(height: 10,),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: mainColor,
                                  border: Border.all(
                                    color: signColor,
                                    width: 2,
                                  )
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 10,),
                                    productQuantity(Icons.add, index),
                                    SizedBox(width: 10,),
                                    Text(cartItems.quantity.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                    ),),
                                    SizedBox(width: 10,),
                                    productQuantity(Icons.remove, index),
                                    SizedBox(width: 10,),
                                  ],
                                ),
                              )
                            ],
                          ))
                    ],
                  );
                }
              )
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/widgets/favourite_btn.dart';
import '../../data/product_data.dart';
import '../../models/products_model.dart';
import '../../providers/add_to_cart_provider.dart';
import '../../providers/favourite_provider.dart';

class AddToCart extends StatefulWidget {
  final Product product;
  const AddToCart({super.key,
    required this.product});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final productList = ProductData().productList;

  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final fProvider = FavouriteProvider.of(context);
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.09,
      bottom: MediaQuery.of(context).size.height*0.01,
      right: MediaQuery.of(context).size.width*0.009,
      left: MediaQuery.of(context).size.width*0.009),
        height: MediaQuery.of(context).size.height*0.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color:buttonBackgroundColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Container(
              margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.009, ),
              height: MediaQuery.of(context).size.height*0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                  color: Colors.white
                //border: Border.all(color: Colors.white, width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      if (currentIndex != 1) {
                        setState(() {
                          currentIndex--;
                        });
                      }
                    },
                    iconSize: 18,
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    currentIndex.toString(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                    ),
                  ),
                  const SizedBox(width: 5),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        currentIndex++;
                      });
                    },
                    iconSize: 18,
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
             
              FavoutiteButton(product: widget.product)
            ]
            ),
            GestureDetector(
              onTap: () {
                provider.toogleFavourite(widget.product);
                // if items is add then show this snackbar
                const snackBar = SnackBar(
                  content: Text(
                    "Successfully added!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  duration: Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            )
          ],
        ),

    );
  }
}
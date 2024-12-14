import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/products_model.dart';

import '../providers/favourite_provider.dart';
import '../utils/colors.dart';

class FavoutiteButton extends StatelessWidget {
  final Product product;
  const FavoutiteButton({super.key,
    required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = FavouriteProvider.of(context);
    return Container(
        height: MediaQuery.of(context).size.height*0.06,
        width: MediaQuery.of(context).size.width*0.15,
        decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: GestureDetector(
          onTap: () {
            provider.toggleFavourite(product);
          },
          child: Icon(
            provider.isExist(product) ? Icons.favorite : Icons.favorite_border,
            color: mainColor,
            size: 30,
          ),
        )
    );
  }
}

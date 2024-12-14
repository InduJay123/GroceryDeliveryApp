import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/products_model.dart';
import '../providers/history_provider.dart';
import '../utils/colors.dart';

class ChekOutButton extends StatelessWidget {
  final Product product;
  const ChekOutButton({super.key,
    required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = HistoryProvider.of(context);
    return Container(
        height: MediaQuery.of(context).size.height*0.06,
        width: MediaQuery.of(context).size.width*0.15,
        decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: GestureDetector(
          onTap: () {
            provider.toggleHistory(product);
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

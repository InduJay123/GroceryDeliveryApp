import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import '../models/products_model.dart';
import '../utils/colors.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final Product product;
  const AppColumn({super.key,
    required this.product});

  @override
  Widget build(BuildContext context) {

    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: product.name, size: MediaQuery.of(context).size.width*0.1,),
        SizedBox(height: MediaQuery.of(context).size.height*0.01,),
        Row(
          children: [
            Wrap(
                children: List.generate(5, (index) {return const Icon(Icons.star,color: mainColor,size: 15,);})
            ),
            const SizedBox(width: 10,),
            SmallText(text: product.rate),
            const SizedBox(width: 10,),
            SmallText(text: product.comment),
            const SizedBox(width: 10,),
            SmallText(text: 'comments')
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
                icon: Icons.price_change_outlined,
                text: product.price.toString(),
                iconColor: iconColor1
            ),
            IconAndTextWidget(
                icon: Icons.circle_outlined,
                text: product.type,
                iconColor: mainColor2
            ),
            IconAndTextWidget(
                icon: Icons.access_alarm_rounded,
                text: product.min,
                iconColor: iconColor2
            ),
          ],
        )
      ],
    );
  }
}

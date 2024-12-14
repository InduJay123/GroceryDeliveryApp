import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/grocery/popular_grocery_details.dart';
import 'package:food_delivery_app/providers/favourite_provider.dart';
import '../models/products_model.dart';
import '../utils/colors.dart';
import '../widgets/big_text.dart';
import '../widgets/icon_and_text_widget.dart';
import '../widgets/small_text.dart';

class RecommendedProductCard extends StatelessWidget {
  final Product product;
  const RecommendedProductCard({super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final provider = FavouriteProvider.of(context);
    
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PopularGroceryDetails(product: product))
        );
      },
      child: Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05),
            padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.00009,bottom: MediaQuery.of(context).size.height*0.01),
            child: Row(
                children: [
            //image section
            Container(
            height: MediaQuery.of(context).size.height*0.1,
            width: MediaQuery.of(context).size.width*0.24,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.02),
                color: Colors.white30,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        product.img
                    )
                )
            ),
          ),

          //text container
          Expanded(
            child: Container(
               height: MediaQuery.of(context).size.height*0.1,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.only(
                    topRight: Radius.circular(MediaQuery.of(context).size.height*0.05),
                    bottomRight: Radius.circular(MediaQuery.of(context).size.height*0.05),
               ),
              color: CupertinoColors.white
               ),

              child: Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.01),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BigText(text: product.name),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.03,
                              width: MediaQuery.of(context).size.width*0.06,
                              decoration: BoxDecoration(
                                  //color: mainColor,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  bottomLeft: Radius.circular(10),
                                )
                              ),
                                child: GestureDetector(
                                  onTap: () {
                                    provider.toggleFavourite(product);
                                  },
                                    child: Icon(
                                      provider.isExist(product) ? Icons.favorite : Icons.favorite_border,
                                      color: mainColor,
                                      size: 22,
                                    ),
                                )
                            )
                          )
                        ],
                    ),
                    //BigText(text: product.name),
                    SizedBox(height: MediaQuery.of(context).size.height*0.002,),
                    SmallText(text: product.description),
                    SizedBox(height: MediaQuery.of(context).size.height*0.002,),
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
                          icon: Icons.star,
                          text: product.rate,
                          iconColor: iconColor2
                        ),
                      ],
                    )
                  ],
              ),
            ),
          ),
          ),
          ],
        )
      ),
    );
  }
}

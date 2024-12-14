import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/grocery/recommended_grocery_details.dart';
import '../data/product_data.dart';
import '../models/products_model.dart';
import '../widgets/app_column.dart';

class PopularProductCard extends StatelessWidget {
  final Product product;
  const PopularProductCard({super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {

    return  GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RecommendedGroceryDetails(product: product))
        );
      },
      child: Stack(
            children:[
              Container(
                height: MediaQuery.of(context).size.height*0.3,
                margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02,right: MediaQuery.of(context).size.width*0.02),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.03),
                    //color: index.isEven?const Color(0xFF69c5df):const Color(0xFF9294cc),
                    image:  DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            product.img
                        )
                    )
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height*0.13,
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.08,right: MediaQuery.of(context).size.width*0.08, bottom: MediaQuery.of(context).size.height*0.01),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.03),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0xFFe8e8e8),
                            blurRadius: 5.0,
                            offset: Offset(0, 5)
                        ),
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(-5, 0)
                        ),
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(5, 0)
                        )
                      ]
                  ),
                  child: Container(
                      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.01,left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05),
                      child: AppColumn(product:product)
                  ),
                ),
              ),
            ]
        ),
    );


  }
}

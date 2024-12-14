import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/pages/cart/cart_screen.dart';
import 'package:food_delivery_app/pages/favourite_page.dart';
import 'package:food_delivery_app/pages/navigation_bar.dart';
import 'package:food_delivery_app/widgets/app_column.dart';
import 'package:food_delivery_app/widgets/favourite_btn.dart';
import '../../models/products_model.dart';
import '../../providers/favourite_provider.dart';
import '../../utils/colors.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text_widget.dart';
import '../cart/add_to_cart.dart';

class PopularGroceryDetails extends StatelessWidget {
  final Product product;
  const PopularGroceryDetails({super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: AddToCart(product: product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            product.img
                        )
                    )
                ),
              )),
          Positioned(
              top: 45,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NavigationBarScreen()),
                      ); // Navigate to the home page
                       },
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppIcon(icon: Icons.shopping_cart_outlined)
                    ],
                  ),
                ],
              )
          ),

           Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top:  410,
               child: Container(
                padding: EdgeInsets.only(left: 20,
                    right: 20,
                    top: 0,
                    bottom: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)
                    ),
                    color: Colors.white
                ),

                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(product: product,),
                      SizedBox(height: 18,),
                      BigText(text: 'Introduction'),
                      SizedBox(height: 12,),
                      Expanded(
                          child: SingleChildScrollView(
                              child: ExpandableTextWidget(
                                  text: 'Vegetables in grocery shops may be sold fresh, frozen, or pre-packaged. They are often arranged to keep them visually appealing and easy to access, with fresh produce being highlighted for customers. Pricing and availability depend on seasonality, with some vegetables sourced locally and others imported to meet demand.'
                              )
                          )
                      ),
                    ]
                ),
               )
           ),
        ],
      ),
          );

      //AddToCart(product: widget.product);

      // bottomNavigationBar: Container(
      //  height: Dimensions.bottomHeight,
      // // margin: EdgeInsets.only(right:Dimensions.width10,),
      //   padding: EdgeInsets.only(top: Dimensions.height10,bottom: Dimensions.height10,left: Dimensions.width20,right: Dimensions.width20),
      //   decoration: BoxDecoration(
      //     color: buttonBackgroundColor,
      //     borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(Dimensions.radius30),
      //       topRight: Radius.circular(Dimensions.radius30),
      //     )
      //    ),
      //    child:Column(
      //        children: [
      //          Row(
      //            mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //              children: [
      //               Container(
      //                   margin: EdgeInsets.only(left: Dimensions.width10,),
      //                   padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height10,left: Dimensions.width20,right: Dimensions.width20),
      //                   decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(Dimensions.radius20),
      //                       color: Colors.white
      //                   ),
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                     children: [
      //                       Icon(Icons.remove, color: mainColor,),
      //                       SizedBox(width: Dimensions.width10/2,),
      //                       BigText(text: '0',color: Colors.black,),
      //                       SizedBox(width: Dimensions.width10/2,),
      //                       Icon(Icons.add, color: mainColor,),
      //                     ],
      //                   )
      //               ),
      //                Row(
      //                  children: [
      //                    BigText(text: 'Rs.',color: mainColor,),
      //                    BigText(text: '150.00',color: Colors.black,),
      //                  ],
      //                )
      //              ],
      //          ),
      //          SizedBox(height: Dimensions.height10,),
      //          Container(
      //            width: Dimensions.width30*12,
      //           padding: EdgeInsets.only(top: Dimensions.height10,bottom: Dimensions.height10,left: Dimensions.width30*4,right: Dimensions.width30*3),
      //             //margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10,),
      //             child: BigText(text: 'Add to cart',color: Colors.white,),
      //              decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(Dimensions.radius20/2),
      //                   color: mainColor
      //               ),
      //
      //            ),
      //        ],
      //
      //    ),


  }
}

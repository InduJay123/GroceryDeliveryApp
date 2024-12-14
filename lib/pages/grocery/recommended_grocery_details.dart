import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/expandable_text_widget.dart';
import 'package:food_delivery_app/widgets/favourite_btn.dart';

import '../../models/products_model.dart';
import '../../providers/favourite_provider.dart';
import '../../widgets/big_text.dart';
import '../cart/add_to_cart.dart';

class RecommendedGroceryDetails extends StatelessWidget {
  final Product product;
  const RecommendedGroceryDetails({super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: AddToCart(product: product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 75,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(child: BigText(size: 26,text: product.name,)),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5,bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )
                ),
              ),
            ),
            pinned: true,
            backgroundColor: yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(product.img,
              width: double.maxFinite,
              fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandableTextWidget(text: 'Vegetables in grocery shops may be sold fresh, frozen, or pre-packaged. They are often arranged to keep them visually appealing and easy to access, with fresh produce being highlighted for customers. Pricing and availability depend on seasonality, with some vegetables sourced locally and others imported to meet demand.Vegetables in grocery shops may be sold fresh, frozen, or pre-packaged. They are often arranged to keep them visually appealing and easy to access, with fresh produce being highlighted for customers. Pricing and availability depend on seasonality, with some vegetables sourced locally and others imported to meet demand.Vegetables in grocery shops may be sold fresh, frozen, or pre-packaged. They are often arranged to keep them visually appealing and easy to access, with fresh produce being highlighted for customers. Pricing and availability depend on seasonality, with some vegetables sourced locally and others imported to meet demand.Vegetables in grocery shops may be sold fresh, frozen, or pre-packaged. They are often arranged to keep them visually appealing and easy to access, with fresh produce being highlighted for customers. Pricing and availability depend on seasonality, with some vegetables sourced locally and others imported to meet demand.Vegetables in grocery shops may be sold fresh, frozen, or pre-packaged. They are often arranged to keep them visually appealing and easy to access, with fresh produce being highlighted for customers. Pricing and availability depend on seasonality, with some vegetables sourced locally and others imported to meet demand.Vegetables in grocery shops may be sold fresh, frozen, or pre-packaged. They are often arranged to keep them visually appealing and easy to access, with fresh produce being highlighted for customers. Pricing and availability depend on seasonality, with some vegetables sourced locally and others imported to meet demand.Vegetables in grocery shops may be sold fresh, frozen, or pre-packaged. They are often arranged to keep them visually appealing and easy to access, with fresh produce being highlighted for customers. Pricing and availability depend on seasonality, with some vegetables sourced locally and others imported to meet demand.Vegetables in grocery shops may be sold fresh, frozen, or pre-packaged. They are often arranged to keep them visually appealing and easy to access, with fresh produce being highlighted for customers. Pricing and availability depend on seasonality, with some vegetables sourced locally and others imported to meet demand.'),
                  margin: EdgeInsets.only(left: 20, right: 20),
                )
              ],
            )
          )
        ],
      ),
      // bottomNavigationBar: Container(
      //   height: 20,
      //   // margin: EdgeInsets.only(right:Dimensions.width10,),
      //   padding: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
      //   decoration: BoxDecoration(
      //       color: buttonBackgroundColor,
      //       borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(30),
      //         topRight: Radius.circular(30),
      //       )
      //   ),
      //   child:Column(
      //     children: [
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Container(
      //               margin: EdgeInsets.only(left: 10,),
      //               padding: EdgeInsets.only(top: 20,bottom: 10,left: 10,right: 20),
      //               decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(20),
      //                   color: Colors.white
      //               ),
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 children: [
      //                   Icon(Icons.remove, color: mainColor,),
      //                   SizedBox(width: 10/2,),
      //                   BigText(text: '0',color: Colors.black,),
      //                   SizedBox(width: 10/2,),
      //                   Icon(Icons.add, color: mainColor,),
      //                 ],
      //               )
      //           ),
      //           Row(
      //             children: [
      //               BigText(text: 'Rs.',color: mainColor,),
      //               BigText(size: 30,text: '150.00',color: Colors.black,),
      //             ],
      //           )
      //         ],
      //       ),
      //       SizedBox(height: 10,),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Container(
      //               margin: EdgeInsets.only(left: 10,),
      //               padding: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
      //               decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(30/3),
      //                   color: Colors.white
      //               ),
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 children: [
      //                   Icon(Icons.favorite, color: mainColor,),
      //                 ],
      //               )
      //           ),
      //           Container(
      //             width: 30,
      //             padding: EdgeInsets.only(top: 10,bottom: 10,left: 30,right: 30),
      //             //margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10,),
      //             child: Center(child: BigText(size:30,text: 'Add to cart',color: Colors.white,)),
      //             decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(20/2),
      //                 color: mainColor
      //             ),
      //           ),
      //
      //         ],
      //       ),
      //     ],
      //   ),
      //
      // ),
    );
  }
}

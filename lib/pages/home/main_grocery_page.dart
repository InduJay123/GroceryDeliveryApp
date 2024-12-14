import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/pages/home/search_bar.dart';
import 'package:food_delivery_app/pages/searh.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'grocery_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key,});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    //print('current height is '+MediaQuery.of(context).size.height.toString());
    return  Scaffold(
      body: Column(
       children: [
          Container(
          child: Container(
             margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05,bottom: MediaQuery.of(context).size.height*0.02),
             padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07,right: MediaQuery.of(context).size.width*0.03),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Column(
                   children: [
                     Text('Hello, Induni',style: TextStyle(color: mainColor, fontSize: 25, fontWeight: FontWeight.w500),),
                  ]
               ),
                 Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.11,
                      height: MediaQuery.of(context).size.height*0.05,
                      child: Icon(Icons.location_on,color: Colors.white,size:28,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: mainColor
                      ),
                    )
                )
               ],
             ),
           ),
         ),
          SearchBox(),
          SizedBox(height: MediaQuery.of(context).size.height *0.02,),
          Expanded(child: SingleChildScrollView( child: FoodPageBody(),)),
     ],
     ),
   );
   }
}

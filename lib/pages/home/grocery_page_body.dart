import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/cards/recommended_product_card.dart';
import 'package:food_delivery_app/data/product_data.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import '../../cards/popular_product_card.dart';
import '../../models/products_model.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key,});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {

  final productList = ProductData().productList;

  PageController pageController = PageController(viewportFraction: 0.85);
  var _curPageValue =0.0;
  double _scaleFactor=0.6;
  double _height = 0.05;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _curPageValue =  pageController.page ?? 0.0;
      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        //slider section
        Container(
        height: MediaQuery.of(context).size.height*0.37,
        child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context,position){
        return _buildPageItem(position);
      }),
    ),
        SizedBox(height:MediaQuery.of(context).size.height*0.01),
        //dot
        new DotsIndicator(
          dotsCount: 5,
          position: _curPageValue.clamp(0, 4),
          decorator: DotsDecorator(
            activeColor: mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),

        //popular text
        SizedBox(height:MediaQuery.of(context).size.height*0.02),
        Container(
          margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.08),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Recommended'),
              SizedBox(width: MediaQuery.of(context).size.width*0.04,),
              Container(
                margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.001),
                child: BigText(text: '.',color: Colors.black26,),
              ),
              SizedBox(width: MediaQuery.of(context).size.width*0.04,),
              Container(
                margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.001),
                child: SmallText(text: 'Groceries',),
              )
            ],
          ),
        ),
        //Lis of food and images

        SizedBox(
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
                //NeverScrollbleScrollPhysics - full screen scrollable , AlwaysScrollableScrollPhysics-ListView scrollable
              shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context,index){
                    Product product = productList[index];
                    return RecommendedProductCard(
                        product:productList[index],);
            }),
        ),

      ],
    );
  }
  Widget _buildPageItem(int index){
    Matrix4 matrix = new Matrix4.identity();
    if(index == _curPageValue.floor()){
        var currScale = 1-(_curPageValue-index)*(1-_scaleFactor);
        var currTrans = _height*(1-currScale)/2;
        matrix = Matrix4.diagonal3Values(1, currScale,1)..setTranslationRaw(0, currTrans, 0);

    }else if(index == _curPageValue.floor()+1){
        var currScale = _scaleFactor+(_curPageValue-index+1)*(1-_scaleFactor);
        var currTrans = _height*(1-currScale)/2;
        matrix = Matrix4.diagonal3Values(1, currScale,1);
        matrix = Matrix4.diagonal3Values(1, currScale,1)..setTranslationRaw(0, currTrans, 0);
    }else if(index == _curPageValue.floor()-1) {
        var currScale = 1-(_curPageValue-index)*(1-_scaleFactor);
        var currTrans = _height*(1-currScale)/2;
        matrix = Matrix4.diagonal3Values(1, currScale, 1);
        matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else{
        var currScale = 0.8;
        matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor), 0);
    }

  return Transform(
      transform: matrix,
       child: PopularProductCard(product: productList[index],)

    );
  }
}

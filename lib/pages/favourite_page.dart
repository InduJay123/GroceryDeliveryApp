import 'package:flutter/material.dart';
import 'package:food_delivery_app/providers/favourite_provider.dart';
import 'package:food_delivery_app/utils/colors.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    final provider = FavouriteProvider.of(context);
    final finalLIst = provider.favourites;
    return Scaffold(
      //backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text('Favourite',style: TextStyle(fontWeight: FontWeight.bold),),
          centerTitle: true,
      ),
      body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  itemCount: finalLIst.length,
                    itemBuilder: (context, index){
                    final favouriteItems =finalLIst[index];
                      return Stack(
                          children: [
                              Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.015),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                        color: buttonBackgroundColor
                                    ),
                                      child: Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.01),
                                              width: MediaQuery.of(context).size.width*0.2,
                                              height: MediaQuery.of(context).size.height*0.09,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color: Colors.white
                                              ),
                                                child: Image.asset(favouriteItems.img),
                                            ),
                                            SizedBox(width: 10,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    favouriteItems.name,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16
                                                    ),
                                                  ),
                                                  SizedBox(height: 5,),
                                                  Text(
                                                    favouriteItems.description,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 16,
                                                        color: signColor
                                                    ),
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Text(
                                                    '\$${favouriteItems.price}',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 16
                                                    ),
                                                  ),
                                                ],
                                            )
                                          ],
                                      ),
                                  ),
                              ),
                            Positioned(
                              top:MediaQuery.of(context).size.height*0.04,
                                right:MediaQuery.of(context).size.width*0.06,
                                child: GestureDetector(
                                  onTap: () {
                                    finalLIst.removeAt(index);
                                    setState(() {

                                    });
                                  },
                                  child: Icon(Icons.delete, color: Colors.red,size: 25,),
                                ))
                          ],
                      );
                    }))
          ],
      ),
    );
  }
}

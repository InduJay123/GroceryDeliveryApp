import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import '../data/product_data.dart';
import '../providers/history_provider.dart';

class HistoryPage extends StatefulWidget {

  const HistoryPage({super.key, });

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final productList = ProductData().productList;

  @override
  Widget build(BuildContext context) {
    final provider = HistoryProvider.of(context);
    final finalLIst = provider.histotys;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text('Check Out History',style: TextStyle(fontWeight: FontWeight.bold),),
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
                                    // Text(
                                    //   favouriteItems.description,
                                    //   style: TextStyle(
                                    //       fontWeight: FontWeight.bold,
                                    //       fontSize: 16,
                                    //       color: signColor
                                    //   ),
                                    // ),
                                    // SizedBox(height: 10,),
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

// import 'package:flutter/material.dart';
// import 'package:food_delivery_app/utils/colors.dart';
// import '../data/product_data.dart';
// import '../providers/history_provider.dart';
//
// class HistoryPage extends StatefulWidget {
//   const HistoryPage({super.key});
//
//   @override
//   State<HistoryPage> createState() => _HistoryPageState();
// }
//
// class _HistoryPageState extends State<HistoryPage> {
//   final productList = ProductData().productList;
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = HistoryProvider.of(context);
//     final finalList = provider.histotys;
//
//     // Calculate total items and total price
//     int totalItems = finalList.length;
//     double totalAmount = finalList.fold(0.0, (sum, item) => sum + item.price);
//     List<String> itemNames = finalList.map((item) => item.name).toList();
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: mainColor,
//         title: Text(
//           'Check Out History',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: finalList.length,
//               itemBuilder: (context, index) {
//                 final favouriteItems = finalList[index];
//                 return Stack(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.015),
//                       child: Container(
//                         padding: EdgeInsets.all(10),
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: buttonBackgroundColor,
//                         ),
//                         child: Row(
//                           children: [
//                             Container(
//                               padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
//                               width: MediaQuery.of(context).size.width * 0.2,
//                               height: MediaQuery.of(context).size.height * 0.09,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.white,
//                               ),
//                               child: Image.asset(favouriteItems.img),
//                             ),
//                             SizedBox(width: 10),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   favouriteItems.name,
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 SizedBox(height: 5),
//                                 Text(
//                                   '\$${favouriteItems.price}',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: MediaQuery.of(context).size.height * 0.04,
//                       right: MediaQuery.of(context).size.width * 0.06,
//                       child: GestureDetector(
//                         onTap: () {
//                           finalList.removeAt(index);
//                           setState(() {});
//                         },
//                         child: Icon(
//                           Icons.delete,
//                           color: Colors.red,
//                           size: 25,
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.all(16),
//             color: Colors.grey[200],
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Summary',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   'Total Items: $totalItems',
//                   style: TextStyle(
//                     fontSize: 16,
//                   ),
//                 ),
//                 Text(
//                   'Total Amount: \$${totalAmount.toStringAsFixed(2)}',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.green,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   'Items in Order:',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//                 SizedBox(height: 5),
//                 for (var itemName in itemNames)
//                   Text(
//                     '- $itemName',
//                     style: TextStyle(
//                       fontSize: 14,
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//

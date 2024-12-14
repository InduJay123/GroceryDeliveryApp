import 'package:flutter/material.dart';

import '../../data/product_data.dart';
import '../../models/products_model.dart';
import '../../providers/add_to_cart_provider.dart';
import '../../providers/history_provider.dart';
import '../../utils/colors.dart';

class Out extends StatefulWidget {
  final Product product;
  const Out({super.key, required this.product});

  @override
  State<Out> createState() => _OutState();
}

class _OutState extends State<Out> {

  final productList = ProductData().productList;

  int currentIndex = 1;


  @override
  Widget build(BuildContext context) {

    final provider = CartProvider.of(context);
    final fprovider = HistoryProvider.of(context);

    return Container(
      height: 300,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 15
                  ),
                  filled: true,
                  fillColor: mainColor,
                  hintText: 'Enter Discount Code',
                  hintStyle: TextStyle(
                      color: signColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14
                  ),
                  suffixIcon: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Apply',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: mainColor
                      ),
                    ),
                  )
              )
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('SubTotal',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: signColor,
                    fontSize: 16
                ),
              ),
              Text('\$${provider.totalPrice()}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: signColor,
                    fontSize: 16
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Divider(),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: signColor,
                    fontSize: 18
                ),
              ),
              Text('\$${provider.totalPrice()}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: signColor,
                    fontSize: 18
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: mainColor,
                  minimumSize: Size(double.infinity, 55)
              ),
              onPressed: () {
                fprovider.toggleHistory(widget.product);
                // Navigate to history page
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => HistoryPage()),
                // );

              },
              child: Text(
                'Check Out',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white
                ),
              )
          )

        ],
      ),
    );
  }
}

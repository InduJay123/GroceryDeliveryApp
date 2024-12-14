import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:food_delivery_app/pages/splash_screens/check_out_splash_screen.dart';
import 'package:food_delivery_app/providers/add_to_cart_provider.dart';
import 'package:food_delivery_app/utils/colors.dart';
import '../../providers/history_provider.dart';

class CheckOutBox extends StatelessWidget {
  const CheckOutBox({super.key,  });

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
    padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none
              ),
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 15
              ),
              filled: true,
              fillColor: mainColor,
              hintText: 'Enter Discount Code',
              hintStyle: const TextStyle(
                color: signColor,
                fontWeight: FontWeight.w600,
                fontSize: 14
              ),
              suffixIcon: TextButton(
                onPressed: () {},
                child: const Text(
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
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('SubTotal',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: signColor,
                fontSize: 16
              ),
              ),
              Text('\$${provider.totalPrice()}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: signColor,
                    fontSize: 16
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          const Divider(),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: signColor,
                    fontSize: 18
                ),
              ),
              Text('\$${provider.totalPrice()}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: signColor,
                    fontSize: 18
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: mainColor,
              minimumSize: const Size(double.infinity, 55)
            ),
              onPressed: () {
                //fprovider.toggleHistory(product);
                // Navigate to history page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SplashScreen()),
                );

              },
              child: const Text(
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

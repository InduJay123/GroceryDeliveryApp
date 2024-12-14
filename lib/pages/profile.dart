import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';

import 'authentication/auth.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthServices _auth = AuthServices();

    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: Stack(
        children: [
          Image.asset(
            "assets/splash/img2.jpg",
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height *0.48,
            width: size.width,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  height: size.height * 0.43,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Stack(
                                  children: [
                                    const CircleAvatar(
                                      radius: 42,
                                      backgroundImage:
                                      AssetImage("assets/splash/img2.jpg"),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:mainColor,
                                          //Color.fromARGB(255, 95, 225, 99),
                                        ),
                                        child: const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 19,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          border: Border.all(
                                              color: Colors.black54)),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 9, horizontal: 12),
                                      child: const Text(
                                        "Edit",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    // Container(
                                    //   decoration: BoxDecoration(
                                    //     borderRadius: BorderRadius.circular(20),
                                    //     color: Colors.pink,
                                    //   ),
                                    //   padding: const EdgeInsets.symmetric(
                                    //       vertical: 8, horizontal: 12),
                                      ElevatedButton(
                                        style: const ButtonStyle(
                                          backgroundColor: MaterialStatePropertyAll(mainColor),
                                        ),
                                        onPressed: () async {
                                          await _auth.signOut();
                                        },
                                       // child: const Icon(Icons.logout,color: kMainDarkBlue,size: 32,),
                                      //),
                                      child: const Text(
                                        "Sign Out",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.009),
                            const Text(
                              "Induni Jayamanne",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 35,
                              ),
                            ),
                            const Text(
                              "No:211, 'Golden Flower Garden, Galle",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: Colors.black45),
                            ),
                           SizedBox(height: MediaQuery.of(context).size.height*0.02),
                            const Text(
                              "Payment Details :",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: Colors.black45),
                            ),
                            const Text(
                              "Sampath Bank ,Galle",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: Colors.black45),
                            ),
                            const Text(
                              "009585632145995822",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: Colors.black45),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const Divider(
                        color: Colors.black12,
                      ),
                      SizedBox(
                        height: 62,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            friendAndMore("Proceed Orders", "8"),
                            friendAndMore("Badge", "Silver"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox friendAndMore(title, number) {
    return SizedBox(
      width: 112,
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black26),
          ),
          Text(
            number,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.blueAccent,
            ),
          )
        ],
      ),
    );
  }
}
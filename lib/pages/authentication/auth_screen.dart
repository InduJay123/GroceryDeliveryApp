import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/authentication/log.dart';
import 'package:food_delivery_app/pages/authentication/reg.dart';
import 'package:food_delivery_app/utils/colors.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                color: mainColor
              ),
            ),
            bottom: TabBar(
                tabs: const [
                  Tab(
                    icon: Icon(Icons.lock, color: Colors.white,size: 34,),
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  Tab(
                      icon: Icon(Icons.person, color: Colors.white,size: 34,),
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )
                ],
              indicatorColor: mainColor,
              indicatorWeight: 6,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 6.0, color: Colors.white70),
                insets: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.24), // Increases length
              ),
            ),
          ),
          body: Container(
            child: TabBarView(
              children: const [
               SignIn(),
                Register(),
              ],
            )
          ),
        )
    );
  }
}

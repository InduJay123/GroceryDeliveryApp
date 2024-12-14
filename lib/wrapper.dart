import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/authentication/auth_screen.dart';
import 'package:food_delivery_app/pages/navigation_bar.dart';
import 'package:provider/provider.dart';

import 'models/user_model.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //the user data that the provider proides this can be a user data or can be null.
    final user = Provider.of<UserModel?>(context);

    if (user == null) {
      return AuthPage();
    } else {
      return NavigationBarScreen();
    }
  }
}
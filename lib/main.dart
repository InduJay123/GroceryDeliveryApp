import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/splash_screens/main_spalsh_screen.dart';
import 'package:food_delivery_app/providers/add_to_cart_provider.dart';
import 'package:food_delivery_app/providers/favourite_provider.dart';
import 'package:food_delivery_app/providers/history_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=>CartProvider()),
      ChangeNotifierProvider(create: (_)=>FavouriteProvider()),
      ChangeNotifierProvider(create: (_)=>HistoryProvider()),
    ],
   child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery App',
      theme: ThemeData(

        primarySwatch: Colors.blue
      ),
      home:SplashScreen()
    ),
  );
  }


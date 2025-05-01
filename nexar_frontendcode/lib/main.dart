import 'package:ecommerce/screens/nav_bar_screens.dart';
import 'package:ecommerce/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/Provider/add_to_cart_provider.dart';
import 'package:ecommerce/Provider/favorite_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
          providers: [
            // for add to cart
            ChangeNotifierProvider(create: (_) => CartProvider()),
            // for favorite
            ChangeNotifierProvider(create: (_) => FavoriteProvider()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
            routes: {
              // Define '/home' route to accept a token dynamically
              '/home': (context) {
                // final token = ModalRoute.of(context)?.settings.arguments as String;
                return BottomNavBar();
              },
            },
          ));
}

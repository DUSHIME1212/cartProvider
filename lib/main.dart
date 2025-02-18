import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/models/Shop.dart';
import 'package:shoppingapp/pages/cart_page.dart';
import 'package:shoppingapp/pages/intro_page.dart';
import 'package:shoppingapp/pages/shop_page.dart';
import 'package:shoppingapp/themes/light_mode.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      theme: lightMode,
      routes: {
        '/shop_page': (context) => ShopPage(),
        '/intro_page': (context) => IntroPage(),
        '/cart_page': (context) => CartPage(),
      },
    );
  }
}

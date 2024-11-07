import 'package:flutter/material.dart';
import 'package:thuchanh/model/cart_provider.dart';
import 'package:thuchanh/pages/home_page.dart';
import 'package:thuchanh/pages/item_page.dart';
import 'package:provider/provider.dart';
import 'package:thuchanh/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFFCEDDEE)),
      home: HomePage(),
      routes: {
        //"/": (context) => LoginScreen(),
        "homePage": (context) => HomePage(),
        "itemPage": (context) => ItemPage(),
      },
      
    );
  }
}

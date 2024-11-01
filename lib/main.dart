import 'package:flutter/material.dart';
import 'package:thuchanh/home_page.dart';
import 'package:thuchanh/item_page.dart';
//import 'package:thuchanh/login_screen.dart';

import 'package:thuchanh/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFFCEDDEE)),
      home: SplashScreen(),
      routes: {
        //"/": (context) => LoginScreen(),
        "homePage": (context) => HomePage(),
        "itemPage": (context) => ItemPage(),
      },
      
    );
  }
}

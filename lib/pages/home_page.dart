import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:thuchanh/bottom_cart_sheet.dart';

import 'package:thuchanh/item_widget.dart';
import 'package:thuchanh/my_deawer.dart';
import 'package:thuchanh/row_item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> listItem = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.category_outlined),
        label: 'home',
      ),
       const BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        label: 'cart',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: 'favorite',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'person',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: badges.Badge(
              badgeContent: const Text(
                '3', 
                style: TextStyle(color: Colors.white),
              ),
              position: badges.BadgePosition.topEnd(top: 0, end: 0),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                               BottomCartSheet()));
                },
              ),
            ),
          ),
        ],
      ),
      drawer: const MyDeawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFF9A826).withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      width: 300,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search",
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.search,
                      size: 25,
                      color: Color.fromARGB(255, 41, 48, 62),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const RowItemWidget(),
              const SizedBox(height: 30),
              const ItemWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: listItem, type: BottomNavigationBarType.fixed,
          onTap: (index) {
          if (index == 1) { 
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => BottomCartSheet(),
              ),
            );
          }
          }
          ),
    );
  }
}

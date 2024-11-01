import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:thuchanh/bottom_nav_bar.dart';
import 'package:thuchanh/item_widget.dart';
import 'package:thuchanh/row_item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          
          children: [
            
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xFFF9A826),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFF9A826).withOpacity(0.3),
                          blurRadius: 5,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.sort,
                      size: 30,
                      color: Color.fromARGB(255, 41, 48, 62),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xFFF9A826),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFF9A826).withOpacity(0.3),
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: badges.Badge(
                        // padding: EdgeInsets.all(7),
                        badgeContent: Text(
                          "3",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        child: Icon(
                        Icons.shopping_cart,
                        size: 30,
                        color: Color.fromARGB(255, 41, 48, 62),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          

            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFF9A826).withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "seach",
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.search,
                    size: 25,
                    color: Color.fromARGB(255, 41, 48, 62),
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            RowItemWidget(),
            SizedBox(height: 30),
            ItemWidget(),
          ],
        ),
      )),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

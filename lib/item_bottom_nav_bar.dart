import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thuchanh/model/cart_provider.dart';
import 'package:thuchanh/model/product.dart';


class ItemBottomNavBar extends StatelessWidget {
  final String selectedSize;

  const ItemBottomNavBar({super.key, required this.selectedSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF5F9FD),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              
              Provider.of<CartProvider>(context, listen: false).addToCart(
                
                Product(
                  id: "1", 
                  name: "nike ", 
                  price: 45.00, 
                  size: selectedSize, image: '1.png', 
                ),
              );
              
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Added to cart")),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
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
              child: Row(
                children: [
                  Text(
                    "Add To Cart",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    CupertinoIcons.cart_badge_plus,
                    color: Colors.white,
                    size: 32,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

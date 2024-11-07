import 'package:flutter/material.dart';
import 'product.dart';

class CartProvider with ChangeNotifier {
  final List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

 void removeFromCart(Product product) {
  _cartItems.removeWhere((item) => item.id == product.id);
  notifyListeners();
}


  double get totalPrice => _cartItems.fold(0, (total, item) => total + item.price);
}

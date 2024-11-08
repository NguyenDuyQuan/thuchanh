import 'package:flutter/material.dart';
import 'product.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  int get totalItems => _cartItems.length;

  void addToCart(Product product) {
  int index = _cartItems.indexWhere(
    (item) => item['id'] == product.id && item['size'] == product.size,
  );

  if (index != -1) {
    
    _cartItems[index]['quantity']++;
  } else {
    
    _cartItems.add({
      'id': product.id,
      'size': product.size,
      'name': product.name,
      'price': product.price,
      'image': product.image,
      'quantity': 1, 
    });
  }
  notifyListeners();
}



  void removeFromCart(Map<String, dynamic> product) {
  _cartItems.removeWhere(
    (item) => item['id'] == product['id'] && item['size'] == product['size'],
  );
  notifyListeners();
}


  void updateSize(String productId, String newSize) {
    int index = _cartItems.indexWhere((item) => item['id'] == productId);
    if (index != -1) {
      _cartItems[index]['size'] = newSize;
      notifyListeners();
    }
  }

  void updateQuantity(String productId, int newQuantity) {
    int index = _cartItems.indexWhere((item) => item['id'] == productId);
    if (index != -1) {
      if (newQuantity > 0) {
        _cartItems[index]['quantity'] = newQuantity;
      } else {
        _cartItems.removeAt(index);
      }
      notifyListeners();
    }
  }

  double get totalPrice => _cartItems.fold(
        0,
        (total, item) => total + item['price'] * item['quantity'],
      );

  bool isInCart(Product product) {
    return _cartItems.any(
      (item) => item['id'] == product.id && item['size'] == product.size,
    );
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}

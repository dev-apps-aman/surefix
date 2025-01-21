import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  int cartItemCount = 0;

  void addToCart() {
    cartItemCount++;
    notifyListeners();
  }

  void removeFromCart() {
    if (cartItemCount > 0) {
      cartItemCount--;
      notifyListeners();
    }
  }
}

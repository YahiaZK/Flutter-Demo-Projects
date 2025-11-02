import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ['fidget1', '42.0', 'lib/images/fidget1.png'],
    ['fidget2', '53.0', 'lib/images/fidget2.png'],
    ['fidget4', '34.0', 'lib/images/fidget4.png'],
    ['fidget3', '98.0', 'lib/images/fidget3.png'],
  ];

  List _cartItems = [];

  get shopItems => _shopItems;
  get cartItems => _cartItems;

  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotalPrice() {
    double totalprice = 0;
    for (var i = 0; i < _cartItems.length; i++) {
      totalprice += double.parse(_cartItems[i][1]);
    }
    return totalprice.toString(); 
  }
}

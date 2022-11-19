import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItem = [
    ["Avocado", "4.00", "assets/avocado",Colors.green],
    ["Banana", "2.5", "assets/banana",Colors.yellow],
    ["Chicken", "12.80", "assets/chicken",Colors.brown],
    ["Soft Drinks", "10.0", "assets/softDrink",Colors.blue],
    ["Rice", "10.0", "assets/rice",Colors.grey[100]],
    ["Dal", "8.0", "assets/dal",Colors.redAccent],
  ];

  List _cartItems = [];

  get shopItem => _shopItem;

  get cartItem => _cartItems;

  //add items to cart
void addItemToCart(int index) {
  _cartItems.add(_shopItem[index]);
  notifyListeners();
}

//remove item from cart
void removeItemFromCart(int index) {
  _cartItems.remove(index);
  notifyListeners();
}

//calculate total price
String calculateTotal() {
  double totalPrice = 0;
  for(int i = 0; i < _cartItems.length; i++) {
    totalPrice += double.parse(_cartItems[i][1]);
  }
  return totalPrice.toStringAsFixed(2);
}
}
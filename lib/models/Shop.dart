import 'package:flutter/cupertino.dart';
import 'package:shoppingapp/models/product.dart';

class Shop extends ChangeNotifier {
  //product for sale
  final List<Product> _shop = [
    Product(
      name: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imagePath:
          'https://i.pinimg.com/736x/38/24/b2/3824b281c386fa011e59f5a3dade0943.jpg',
    ),
    Product(
      name: 'Blue Shirt',
      description: 'A blue shirt - it is pretty blue!',
      price: 29.99,
      imagePath:
          'https://i.pinimg.com/736x/c7/01/d1/c701d15fff6dd7fa23f2c2d284d099bd.jpg',
    ),
    Product(
      name: 'Yellow Shirt',
      description: 'A yellow shirt - it is pretty yellow!',
      price: 29.99,
      imagePath:
          'https://i.pinimg.com/736x/75/b5/1e/75b51e7de0a8f744ce5bf34e89769b7f.jpg',
    ),
    Product(
      name: 'Green Shirt',
      description: 'A green shirt - it is pretty green!',
      price: 29.99,
      imagePath:
          'https://i.pinimg.com/736x/68/49/5c/68495c85832f767a72a3cf31108cea80.jpg',
    ),
  ];

  //use cart
  final List<Product> _cart = [];

  //get product list
  List<Product> get shop => _shop;

  //get user cart
  List<Product> get cart => _cart;

  //add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}

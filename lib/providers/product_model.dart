import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  bool isFav;
  Product({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.description,
    @required this.imageUrl,
    this.isFav = false,
  });
  void favouriteStatus() {
    isFav = !isFav;
    notifyListeners();
  }
}

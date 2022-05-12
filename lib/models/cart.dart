import 'package:flutter/material.dart';
import 'package:foodcourtapp/models/ModelItem.dart';


class Cart {
  final ItemModel item;
  final int numOfItem;

  Cart({required this.item, required this.numOfItem});
}


// Demo data for our cart
List<Cart> carts = [
  Cart(item: product[0], numOfItem: 2),
  Cart(item: product[1], numOfItem: 1),
  Cart(item: product[3], numOfItem: 1),
];
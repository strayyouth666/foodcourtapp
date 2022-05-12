import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:flutter_svg/flutter_svg.dart';


class ItemModel {
  final String name, image, description, stand, qty;
  final int id;
  final Color color;
  final bool isActive;
  //final Function press;
  bool fav;
  double rating, price;
  int? shopId;

  ItemModel({this.shopId,
    required this.stand,
    required this.name,
    required this.image,
    required this.description,
    required this.qty,
    required this.price,
    required this.id,
    this.isActive = false,
    //required this.press,
    required this.fav,
    required this.rating,
    required this.color});


  factory ItemModel.fromJson(Map<String, dynamic> json) => new ItemModel(
      stand: json['stand'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      qty: json['qty'],
      price: json['price'],
      id: json['id'],
      fav: json['fav'] == 1,
      rating: json['rating'],
      color: json ['color'],
      shopId: json['shopId'] ?? 0,
      //press: json['press'] ?? 0,
    );


  Map<String, dynamic> toMap() {
    return{
      'stand': stand,
      'image': image,
      'description': description,
      'qty': qty,
      'price': price,
      'fav': fav = 1 as bool,
      'rating': rating,
      'color': color,
      'shopId': shopId ?? 0,
      'id': id,
      'name': name,
    };
  }
}

// class DatabaseHelper {
//   DatabaseHelper._privateConstructor();
//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
//
//   static Database? _database;
//   Future<Database> get database async => _database ??= await _initDatabase;
//
//   Future<Database> _initDatabase() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, 'foodcourtku.db');
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _onCreate,
//     );
//   }
//
//   Future _onCreate(Database db, int version) async {
//     await db.execute('''
//     CREATE TABLE foodcourtku(
//     id INTEGER PRIMARY KEY,
//     name TEXT
//     )
//     ''');
//   }
//
//   Future<List<ItemModel>> getFood() async {
//     Database db = await instance.database;
//     var food = await db.query(('food', orderBy: 'name'));
//     List<ItemModel> itemmodelList = food.isNotEmpty
//         ? food.map((c) => ItemModel.fromMap(c)).toList()
//         :[];
//     return itemmodelList;
//   }
//
//   Future<int> add(ItemModel itemmodel) async {
//     Database db = await instance.database;
//     return await db.insert('itemModel', itemModel.toMap());
//   }
//
//   Future<int> remove(int id) async {
//     Database db = await instance.database;
//     return await db.delete('itemModel', where:());
//   }
// }

//Data Demo
  List<ItemModel> product = [
    ItemModel(
      stand: "Mcdonalds",
      id: 1,
      name: "Hamburger",
      description: "default",
      qty: "10",
      price: 20000,
      fav: false,
      rating: 4.4,
      image: "lib/pict/burg.jpg",
      //"https://foto.kontan.co.id/s0VRkMh0kfKeu-aE5k836PeMRpg=/smart/2022/01/06/221687372p.jpg",
      color: Color(0xFF383661), //press: ,
    ),
  ItemModel(
      stand: "Mcdonalds",
      id: 2,
      name: "Fried Rice ",
      description: "default",
      qty: "10",
      price: 22000,
      fav: false,
      rating: 4.5,
      image: "lib/pict/fried-rice-2.jpg",
      //"https://foto.kontan.co.id/s0VRkMh0kfKeu-aE5k836PeMRpg=/smart/2022/01/06/221687372p.jpg",
      color: Color(0xFFE7651E), //press: null
     ),

  ItemModel(
      stand: "Mcdonalds",
      id: 3,
      name: "French Fries",
      description: "default",
      qty: "10",
      price: 22000,
      fav: false,
      rating: 4.6,
      image: "lib/pict/kentang.jpg",
      //"https://nos.jkt-1.neo.id/mcdonalds/foods/August2019/NErmB3hmpyesFaaOsnT1.png",
      color: Color(0xFF0C293B), //press: null
    ),

    ItemModel(
      stand: "Mcdonalds",
      id: 4,
      name: "Soft Drink",
      description: "default",
      qty: "10",
      price: 15000,
      fav: false,
      rating: 4.9,
      image: "lib/pict/softdrink.jpg",
      //"https://micdn-13a1c.kxcdn.com/images/hk/content-images/chicker_wings.jpg",
      color: Color(0xFFCE3D8D), //press: null
    ),

    ItemModel(
      stand: "Es Teh Indonesia",
      id: 5,
      name: "EsTeh Hijau",
      description: "default",
      qty: "10",
      price: 15000,
      fav: false,
      rating: 4.9,
      image: "lib/pict/hijau.jpg",
      //"https://micdn-13a1c.kxcdn.com/images/hk/content-images/chicker_wings.jpg",
      color: Color(0xFFF1D3E4), //press: null
    ),

    ItemModel(
      stand: "Es Teh Indonesia",
      id: 6,
      name: "EsTeh Thai Tea",
      description: "default",
      qty: "10",
      price: 15000,
      fav: false,
      rating: 4.9,
      image: "lib/pict/thai.jpg",
      //"https://micdn-13a1c.kxcdn.com/images/hk/content-images/chicker_wings.jpg",
      color: Color(0xFF8FB67D), //press: null
    ),

    ItemModel(
      stand: "Es Teh Indonesia",
      id: 7,
      name: "EsTeh Susu Nusaberry",
      description: "default",
      qty: "10",
      price: 15000,
      fav: false,
      rating: 4.9,
      image: "lib/pict/nusa.jpg",
      //"https://micdn-13a1c.kxcdn.com/images/hk/content-images/chicker_wings.jpg",
      color: Color(0xFF3DC2CE), //press: null
    ),

    ItemModel(
      stand: "Es Teh Indonesia",
      id: 8,
      name: "EsTeh Taro",
      description: "default",
      qty: "10",
      price: 15000,
      fav: false,
      rating: 4.9,
      image: "lib/pict/taro.jpg",
      //"https://micdn-13a1c.kxcdn.com/images/hk/content-images/chicker_wings.jpg",
      color: Color(0xFFFF9B6B), //press: null
    ),
  ];

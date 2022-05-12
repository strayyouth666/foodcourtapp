// import 'package:sqflite/sqflite.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'dart:io';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
//
// class CategoryItem extends StatelessWidget{
//   final int? id;
//   final String name;
//   final bool isActive;
//   final Function press;
//
//   CategoryItem({
//     Key? key,
//     this.id,
//     required this.name,
//     this.isActive = false,
//     required this.press,
//   }) : super(key:key);
//
//   factory CategoryItem.fromMap(Map<String, dynamic> json) => new CategoryItem(
//       id: json['id'],
//       name: json['name'],
//   );
//
//   Map<String, dynamic> toMap() {
//     return{
//       'id': id,
//       'name': name,
//     };
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: press,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//         child: Column(
//           children: <Widget>[
//             Text(
//               title,
//               style: isActive
//                   ? TextStyle(
//                 //color: kTextColor,
//                 fontWeight: FontWeight.bold,
//               )
//                   :TextStyle(fontSize: 12),
//             ),
//             if (isActive)
//               Container(
//                 margin: EdgeInsets.symmetric(vertical:5),
//                 height: 3,
//                 width: 22,
//                 decoration: BoxDecoration(
//                   //color: kTextColor,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
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
//   Future<List<CategoryItem>> getFood() async {
//     Database db = await instance.database;
//     var food = await db.query(('food', orderBy: 'name'));
//     List<CategoryItem> categoryitemList = food.isNotEmpty
//         ? food.map((c) => CategoryItem.fromMap(c)).toList()
//         :[];
//     return categoryitemList;
//   }
//
//   Future<int> add(CategoryItem categoryItem) async {
//     Database db = await instance.database;
//     return await db.insert('categoryItem', categoryItem.toMap());
//   }
//
//   Future<int> remove(int id) async {
//     Database db = await instance.database;
//     return await db.delete('categoryItem', where:());
//   }
// }
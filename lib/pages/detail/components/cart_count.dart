// import 'dart:ffi';
//
// import 'package:flutter/material.dart';
// import 'package:foodcourtapp/controller/homepageController.dart';

// import 'package:foodcourtapp/models/ItemModel.dart';

// import 'package:foodcourtapp/models/ModelItem.dart';
// import 'package:foodcourtapp/widgets/constants.dart';

// import 'package:get/get.dart';
//
//
// class CartCounter extends StatefulWidget {
//   @override
//   _CartCounterState createState() => _CartCounterState();
// }
//
// class _CartCounterState extends State<CartCounter> {
//   int numOfItems = 1;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         buildButton(
//           icon: Icons.remove,
//           press: () {
//             // Get.find<HomePageController>()
//             //      .removeFromCart(d.shopId ?? 0);
//             //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             //      content: Text(
//             //          "Item removed from pages.cart successfully")));
//             if (numOfItems > 1) {
//               setState(() {
//                 numOfItems--;
//               });
//             }
//           },
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
//           child: Text(
//             // if our item is less  then 10 then  it shows 01 02 like that
//             numOfItems.toString().padLeft(2, "0"),
//             style: Theme.of(context).textTheme.headline6,
//           ),
//         ),
//         buildButton(
//             icon: Icons.add,
//             press: () {
//               setState(() {
//                 numOfItems++;
//               });
//             }),
//       ],
//     );
//   }
//
//   SizedBox buildButton({IconData? icon, VoidCallback? press}) {
//     return SizedBox(
//       width: 40,
//       height: 32,
//       child: FloatingActionButton(
//         onPressed: press,
//         child: Icon(icon),
//       ),
//     );
//   }
//
// //   @override
// //   Widget build(BuildContext context) {
// //     throw UnimplementedError();
// //   }
// }
// import 'package:flutter/material.dart';
// import 'package:foodcourtapp/controller/homepageController.dart';
// import 'package:foodcourtapp/models/ModelItem.dart';
// import 'package:foodcourtapp/models/cart.dart';
// import 'package:foodcourtapp/widgets/constants.dart';
// import 'package:foodcourtapp/widgets/size_config.dart';
// import 'package:get/get.dart';
//
//
// class CartCard extends StatelessWidget {
//   //final Cart cart;
//   //const CartCard({Key? key, required this.cart,}) : super(key: key);
//
//
//   Widget generateCart(BuildContext context, ItemModel d) {
//     return Row(
//         children: [
//           Container(
//             height: 100.0,
//             child: Row(
//               children: <Widget>[
//                 Container(
//                   alignment: Alignment.topLeft,
//                   height: 100.0,
//                   width: 100.0,
//                   decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(color: Colors.black12, blurRadius: 5.0)
//                       ],
//                       borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(10.0),
//                           bottomRight: Radius.circular(10.0)),
//                       image: DecorationImage(
//                           image: NetworkImage(d.image), fit: BoxFit.fitHeight)),
//                 ),
//                 Expanded(
//                     child: Padding(
//                       padding: EdgeInsets.only(top: 10.0, left: 15.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Row(
//                             children: <Widget>[
//                               Expanded(
//                                 child: Text(
//                                   d.name,
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 15.0),
//                                 ),
//                               ),
//                               Container(
//                                 alignment: Alignment.bottomRight,
//                                 child: InkResponse(
//                                   onTap: () {
//                                     Get.find<HomePageController>()
//                                         .removeFromCart(d.shopId ?? 0);
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                         SnackBar(
//                                             content: Text(
//                                                 "Item removed from pages.cart successfully")));
//                                   },
//                                   child: Padding(
//                                     padding: EdgeInsets.only(right: 10.0),
//                                     child: Icon(
//                                       Icons.remove_circle,
//                                       color: Colors.red,
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: 5.0,
//                           ),
//                           Text("Price Rp{d.price.toString()}"),
//                         ],
//                       ),
//                     ))
//               ],
//             ),
//           ),
//
//
//       SizedBox(
//        width: 88,
//         child: AspectRatio(
//          aspectRatio: 0.88,
//          child: Container(
//            padding: EdgeInsets.symmetric(horizontal: 20),
//            decoration: BoxDecoration(
//              color: Color(0xFFF5F6F9),
//           borderRadius: BorderRadius.circular(15),
//         ),
//           //child: Image.asset(cart.item.image),
//       ),
//     ),
//   ),
//     ]
//     );
//   }
//
//     getItemTotal(List<ItemModel> items) {
//     double sum = 0.0;
//     items.forEach((e){sum += e.price;});
//     return "\$$sum";
//     }
//
//     @override
//     Widget build(BuildContext context) {
//       final controller = Get.find<HomePageController>();
//       return Scaffold(
//         body: Column(
//           children: [
//         SizedBox(width: 20),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//             child: GetBuilder<HomePageController>(
//             builder: (_) {
//               if (controller.cartItems.length == 0) {
//                 return Center(
//                   child: Text("No item found"),);
//               }
//               return ListView(
//               shrinkWrap: true,
//               children: controller.cartItems.map((d) => generateCart(context, d)).toList(),
//               );
//             }
//             ),
//             ),
//           ],
//         ),
//
//             //   Text(
//             //   cart.item.name,
//             //   style: TextStyle(color: Colors.black, fontSize: 16),
//             //   maxLines: 2,
//             // );
//
//               SizedBox(height: 10),
//           Container(
//         // color: Colors.white,
//             child: SafeArea(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                     child: GetBuilder<HomePageController>(
//                       builder: (_) {
//                         return RichText(
//                           text: TextSpan(
//                               text: "Total  ",
//                               style: TextStyle(color: Colors.black, fontSize: 18),
//                               children: <TextSpan>[
//                                 TextSpan(
//                                   text: getItemTotal(controller.cartItems).toString(),
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w600, color: kPrimaryColor),
//                                 ),
//                                  // TextSpan(
//                                  //          text: " x${controller.cart}",
//                                  //          style: Theme.of(context).textTheme.bodyText1),
//
//                               ]
//                           ),
//                         );
//                       },
//                     )
//                 ),
//             ],
//           ),
//         ),
//       ),
//       ])
//       );
//     }
// }
//

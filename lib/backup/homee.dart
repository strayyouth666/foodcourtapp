// import 'package:foodcourtapp/controller/homepageController.dart';
// import 'package:foodcourtapp/models/ItemModel.dart';
// import 'package:foodcourtapp/models/ModelItem.dart';
// import 'package:foodcourtapp/pages/detail/ItemDetail.dart';
// import 'package:foodcourtapp/ItemPage.dart';
// import 'package:foodcourtapp/services/itemServices.dart';
// import 'package:get/get.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:foodcourtapp/CartPage.dart';
//
//
// // import 'package:flutter_svg/flutter_svg.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:foodcourtapp/category_item.dart';
// // import 'package:foodcourtapp/widgets/custom_search.dart';
//
// class HomePage extends StatefulWidget{
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   ItemServices itemServices = ItemServices();
//   List<ItemModel> items = [];
//   final HomePageController controller = Get.put(HomePageController());
//
//   @override
//   void initState() {
//     //TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     //TODO: implement build
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: Text("Halo, User"),
//           titleTextStyle: TextStyle(color: Colors.black),
//           elevation: 0,
//           actions: <Widget>[
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               child: InkResponse(
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => CartPage()));
//                   },
//                   child: Stack(
//                     children: [
//                       GetBuilder<HomePageController>(builder: (_) => Align(
//                         child: Text(controller.cartItems.length > 0 ? controller.cartItems.length.toString() : ''),
//                         alignment: Alignment.topLeft,
//                       )),
//                       Align(
//                         child: Icon(Icons.shopping_cart),
//                         alignment: Alignment.center,
//                       ),
//                     ],
//                   )),
//             ),
//
//             SizedBox(width: 10, height: 5,),
//             Text("Mau pesan apa hari ini?"),
//           ],
//         ),
//
//         body: Container(
//           child: GetBuilder<HomePageController>(
//             init: controller,
//             builder: (_) => controller.isLoading
//                 ? Center(
//                   child: CircularProgressIndicator(),
//             )
//                 : ShopItemListing(
//               items: controller.items,
//             ),
//           ),
//         ));
//   }
// }
//
// class ShopItemListing extends StatelessWidget {
//   final List<ItemModel> items;
//
//   ShopItemListing({required this.items});
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: GridView.builder(
//         shrinkWrap: true,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2, childAspectRatio: 0.8),
//         itemBuilder: (BuildContext context, int index) {
//           return ItemView(
//             item: items[index],
//           );
//         },
//         itemCount: items.length,
//       ),
//     );
//   }
// }
//
// class ItemView extends StatelessWidget {
//   final ItemModel item;
//
//   ItemView({required this.item});
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Padding(
//       padding: EdgeInsets.all(5.0),
//         child: InkResponse(
//           onTap: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => ItemDetailPage(itemId: item.id)));
//           },
//           child: Material(
//             child: Container(
//                 height: 380.0,
//                 padding: EdgeInsets.all(5.0),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.rectangle,
//                     boxShadow: [
//                       BoxShadow(color: Colors.black12, blurRadius: 8.0)
//                     ]),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Container(
//                       height: 120.0,
//                       child: Padding(
//                         padding: EdgeInsets.all(10.0),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Expanded(
//                               child: Container(
//                                 child: Image.network(
//                                   item.image,
//                                   fit: BoxFit.contain,
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               child: item.fav
//                                   ? Icon(
//                                 Icons.favorite,
//                                 size: 20.0,
//                                 color: Colors.red,
//                               )
//                                   : Icon(
//                                 Icons.favorite_border,
//                                 size: 20.0,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10.0,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 10.0),
//                       child: Text(
//                         "${item.name}",
//                         style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 15.0,
//                         ),
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 10.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Padding(
//                             padding: EdgeInsets.only(right: 10.0),
//                             child: Text(
//                               "\Rp${item.price.toString()}",
//                               style: TextStyle(fontWeight: FontWeight.w500),
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 )),
//           )),
//       // ]
//     // ),
//     );
//   }
// }
//
//
//
// //
// //
// //         IconButton(
// //           onPressed: () {
// //             showSearch(
// //                 context: context,
// //                 delegate: CustomSearchDelegate(),);
// //           },
// //             icon: const Icon(Icons.search),
// //     ),
// //             Container(
// //               margin: EdgeInsets.all(20),
// //               padding: EdgeInsets.symmetric(horizontal: 25,vertical: 5),
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(50),
// //                 border: Border.all(
// //                   color: Colors.black,
// //                 ),
// //               ),
// //             ),
// //
// //       SingleChildScrollView(
// //         scrollDirection: Axis.horizontal,
// //         child: Row(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: <Widget>[
// //             CategoryItem(
// //               name: "Burger",
// //               isActive: true,
// //               press: () {},
// //             ),
// //             CategoryItem(
// //               title: "Fried Chicken",
// //               isActive: true,
// //               press: () {},
// //             ),
// //             CategoryItem(
// //               title: "French Fries",
// //               isActive: true,
// //               press: () {},
// //             ),
// //
// //           ],
// //         ),
// //       ),
// //     ],
// //     );
// //   }
// // }
// //
// //
// //

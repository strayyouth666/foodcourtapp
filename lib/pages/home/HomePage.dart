import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:foodcourtapp/controller/homepageController.dart';
import 'package:foodcourtapp/models/ModelItem.dart';
// import 'package:foodcourtapp/models/cart.dart';
import 'package:foodcourtapp/pages/cart/cart_screen.dart';
import 'package:foodcourtapp/pages/home/components/body.dart';
import 'package:foodcourtapp/services/itemServices.dart';
import 'package:foodcourtapp/widgets/constants.dart';
import 'package:foodcourtapp/widgets/custom_search.dart';
import 'package:get/get.dart';


class HomePage extends StatelessWidget {
  //final controller = HomePageController();
  final counterC = Get.put(HomePageController());

  //late ItemModel item;
  // HomePage({Key? key, required this.item,
  // }) : super(key: key);

  // List<ItemModel> item = [];
  // ItemServices itemServices = ItemServices();

  @override
  // final ItemModel item;
  //  HomePage({Key? key, required this.item,
  // }) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      // leading: IconButton(
      //   icon:  const Icon(Icons.arrow_back),
      //   onPressed: () {},
      //   color: kTextColor,
      // ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            showSearch(
            context: context, delegate: CustomSearchDelegate());
          },
          color: kTextColor,
          ),
        // IconButton(
        //   icon: const Icon(Icons.shopping_cart),
        //   onPressed: () => Get.to(CartScreen(item: item)),
        //       // Navigator.push(context,
        //       // MaterialPageRoute(builder: (context) => CartScreen(),
        //     // By default our  icon color is white
        //   // )),
        //   color: kTextColor,
        // ),
      SizedBox(width: kDefaultPadding / 2)
      ],
    );
  }
}
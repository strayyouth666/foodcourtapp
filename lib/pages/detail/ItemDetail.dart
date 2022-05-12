import 'package:flutter/foundation.dart';
import 'package:foodcourtapp/controller/homepageController.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodcourtapp/models/ModelItem.dart';
import 'package:foodcourtapp/pages/cart/cart_screen.dart';
import 'package:foodcourtapp/pages/detail/components/body.dart';
import 'package:flutter/material.dart';
import 'package:foodcourtapp/widgets/constants.dart';
import 'package:foodcourtapp/widgets/custom_search.dart';
import 'package:get/get.dart';


class ItemDetail extends StatelessWidget {
  //final int itemId;
  final ItemModel item;

  const ItemDetail({Key? key, required this.item,
    //required this.itemId
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  // HomePageController controller = Get.find<HomePageController>();
  // ItemModel item = controller.getItem(widget.itemId);

  return Scaffold(
    // each product have a color
    backgroundColor: item.color,
    appBar: buildAppBar(context),
    body: Body(item: item),
  );
}

  AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: item.color,
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
        color: Colors.white,
      onPressed: () => Navigator.pop(context),
      ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          showSearch(
              context: context, delegate: CustomSearchDelegate());
        },
      ),
      IconButton(
        icon: Icon(Icons.shopping_cart),
        onPressed: () => Get.to(CartScreen(item: item,)),
      ),
      SizedBox(width: kDefaultPadding / 2)
    ],
  );
}
}
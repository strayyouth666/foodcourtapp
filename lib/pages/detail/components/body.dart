import 'package:flutter/material.dart';
import 'package:foodcourtapp/controller/homepageController.dart';
import 'package:foodcourtapp/models/ItemModel.dart';
import 'package:foodcourtapp/pages/detail/components/tittle_pict.dart';
import 'package:foodcourtapp/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodcourtapp/models/ModelItem.dart';
import 'add_cart.dart';
import 'cart_fav.dart';
import 'desc.dart';

class Body extends StatelessWidget {
  final ItemModel item;

  const Body({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.find<HomePageController>();

    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPadding,
                    right: kDefaultPadding,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: kDefaultPadding / 2),
                      Description(item: item),
                      SizedBox(height: kDefaultPadding / 2),
                      CounterWithFavBtn(item: item,),
                      SizedBox(height: kDefaultPadding / 2),
                      AddToCart(item: item)
                    ],
                  ),
                ),
                ProductTitleWithImage(item: item),
              ],
            ),
          )
        ],
      ),
    );
  }
}
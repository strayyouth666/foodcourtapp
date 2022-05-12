import 'dart:ui';
import 'package:foodcourtapp/models/ModelItem.dart';
import 'package:foodcourtapp/pages/cart/cart_screen.dart';
import 'package:foodcourtapp/pages/home/components/categories.dart';
import 'package:flutter/material.dart';
import 'package:foodcourtapp/pages/detail/ItemDetail.dart';
// import 'package:foodcourtapp/pages/home/components/header.dart';
import 'package:foodcourtapp/widgets/constants.dart';
import 'package:foodcourtapp/pages/home/components/item_card.dart';
import 'package:foodcourtapp/widgets/default_button.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:foodcourtapp/pages/home/components/header.dart';

class Body extends StatelessWidget{
  // late int itemId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
      bottom: false,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Padding( padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
            "FoodCourtku",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
          Categories(),
          Expanded(
            child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
             child: GridView.builder(
              itemCount: product.length,

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPadding,
                crossAxisSpacing: kDefaultPadding,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) =>
                  ItemCard(item: product[index],
                      press: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                              ItemDetail(item: product[index],
                                  //itemId:
                                )),
                ),
              ),

            ),
          ),
          ),
        ]
        )
            ),
      );
  }
}
import 'package:flutter/material.dart';
import 'package:foodcourtapp/controller/homepageController.dart';
import 'package:foodcourtapp/models/ModelItem.dart';
import 'package:foodcourtapp/models/cart.dart';
import 'package:foodcourtapp/pages/cart/components/body.dart';
import 'package:get/get.dart';
import 'components/checkout_card.dart';



class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  final ItemModel item;

  const CartScreen({Key? key, required this.item,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomePageController>();
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(item: item),
      bottomNavigationBar: CheckoutCard(),
    );
  }
    AppBar buildAppBar(BuildContext context) {
      return AppBar(
        backgroundColor: Colors.blueGrey,
        title: Column(
          children: [
            Text(
              "Your Cart",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "${carts.length} items",
              style: Theme
                  .of(context)
                  .textTheme
                  .caption,
            ),
          ],
        ),
      );
    }
  }


import 'package:flutter/material.dart';
import 'package:foodcourtapp/controller/homepageController.dart';

import 'package:foodcourtapp/models/ItemModel.dart';
// import 'package:foodcourtapp/models/cart.dart';

import 'package:foodcourtapp/models/ModelItem.dart';
import 'package:foodcourtapp/models/cart.dart';

import 'package:foodcourtapp/pages/cart/components/body.dart';
import 'package:get/get.dart';
import 'components/checkout_card.dart';




class CartScreen extends StatefulWidget {
  static String routeName = "/cart";
  final ItemModel item;

  CartScreen({Key? key, required this.item}) : super(key: key);
  @override
  CartState createState() => new CartState(item);
}

class CartState extends State<CartScreen> {
  ItemModel item;
  CartState(this.item);
  HomePageController controller = Get.find<HomePageController>();
  int numOfItems = 1;

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
        elevation: 0.0,
        leading: Container(),
        backgroundColor: Colors.blueGrey,
        title: MaterialButton(
          onPressed: (){},
          child: Row(
            children: [
              Text(
                "Cart", style: TextStyle(color: Colors.white),),
              // Icon(Icons.shopping_cart,color: Colors.white,),
              SizedBox(height: 5,),
              Text(
              "Your Table Number?", style: TextStyle(color: Colors.white),),
              Icon(Icons.edit_outlined,color: Colors.white,),
          ]
          )
        ),
            // actions: [
            //   Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: Icon(Icons.account_circle_outlined),
            //   ),
            // ],
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'fill with your table number',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.zero,
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),


            // Text(
            //   "${carts.length} items",
            //   style: Theme
            //       .of(context)
            //       .textTheme
            //       .caption,
            // ),

        // child: Column(
        //   children: [
        //     Text(
        //       "Your Cart",
        //       style: TextStyle(color: Colors.white),
        //     ),
        //     Text(
        //       "${carts.length} items",
        //       style: Theme
        //           .of(context)
        //           .textTheme
        //           .caption,
        //     ),
        //   ],
        // ),

      );
    }
  }



class CartScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(
          () => HomePageController(),
    );
  }
}


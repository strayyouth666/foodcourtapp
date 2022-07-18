import 'package:flutter/material.dart';
import 'package:foodcourtapp/controller/homepageController.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:foodcourtapp/backup/homee.dart';
<<<<<<< HEAD
=======
import 'package:foodcourtapp/models/ItemModel.dart';
// import 'package:foodcourtapp/pages/cart/cart_screen.dart';
// import 'package:foodcourtapp/widgets/CustomButton.dart';
>>>>>>> 27f5e05 (0.0.1)
import 'package:foodcourtapp/models/ModelItem.dart';
import 'package:foodcourtapp/pages/cart/cart_screen.dart';
import 'package:foodcourtapp/widgets/CustomButton.dart';
// import 'package:foodcourtapp/widgets/CustomButton.dart';
import 'package:foodcourtapp/widgets/constants.dart';
import 'package:get/get.dart';


class AddToCart extends StatelessWidget {

  final ItemModel item;
  const AddToCart({ Key? key, required this.item,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.find<HomePageController>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: kDefaultPadding),
            height: 52,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: item.color,
              ),
            ),
<<<<<<< HEAD
=======

>>>>>>> 27f5e05 (0.0.1)
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
                color: item.color,
              onPressed: () => Get.to(() => CartScreen(item: item)),
              ),

            ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GetBuilder<HomePageController>(builder: (_) {
                bool isAdded = controller.isAlreadyInCart(item.id);
                if (isAdded) {

                return MaterialButton(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
                  color: item.color,
                  onPressed: () async {
                    try {
                    controller.removeFromCart(item.id);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Item removed from pages.cart successfully")));
                  } catch (e) {
                  print(e);
                  }
                },
                  child: Text(
                  "Remove item".toUpperCase(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    ),
                  );
                }

                  return MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    color: item.color,
                    onPressed: () async {try {
                      var result = await controller.addToCart(item);
                      controller.getCardList();
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("Item added in pages.cart successfully")));
                    } catch (e) {
                      print(e);
                    }
                    },
                    child: Text(
                      "Add to Cart".toUpperCase(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  );
                }

                  //   return CustomButton(
                  //   name: "REMOVE CART",
                  //   onTap: () async {
                  //     try {
                  //       controller.removeFromCart(item.id);
                  //       ScaffoldMessenger.of(context)
                  //           .showSnackBar(SnackBar(content: Text("Item removed from pages.cart successfully")));
                  //     } catch (e) {
                  //       print(e);
                  //     }
                  //   },
                  // );
                // return CustomButton(
                //   name: "ADD TO CART",
                //   onTap: controller.isLoading ? null : ()  async {
                //     try {
                //       var result = await controller.addToCart(item);
                //       controller.getCardList();
                //       ScaffoldMessenger.of(context)
                //           .showSnackBar(SnackBar(content: Text("Item added in pages.cart successfully")));
                //     } catch (e) {
                //       print(e);
                //     }
                //   },
                // );

              )
            ],
          )
        ],
      ),
    );
  }
}
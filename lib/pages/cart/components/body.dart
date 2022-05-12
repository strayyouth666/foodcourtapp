import 'package:flutter/material.dart';
import 'package:foodcourtapp/controller/homepageController.dart';
import 'package:foodcourtapp/models/ModelItem.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:foodcourtapp/models/cart.dart';
import 'package:foodcourtapp/widgets/constants.dart';
import 'package:get/get.dart';
// import 'package:foodcourtapp/widgets/size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  final ItemModel item;
  Body({Key? key, required this.item}) : super(key: key);

  @override
  BodyState createState() => new BodyState(item);
}

class BodyState extends State<Body> {
  ItemModel item;
  BodyState(this.item);
  HomePageController controller = Get.find<HomePageController>();
  int numOfItems = 1;

  Widget generateCartBody(BuildContext context, ItemModel d) {
    return Row(
        children: [
          Container(
            height: 100.0,
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 5.0)
                      ],
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                      image: DecorationImage(
                          image: NetworkImage(d.image), fit: BoxFit.fitHeight)),
                ),
                Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  d.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.0),
                                ),
                              ),
                              Container(
                                alignment: Alignment.bottomRight,
                                child: InkResponse(
                                  onTap: () {
                                    Get.find<HomePageController>()
                                        .removeFromCart(d.shopId ?? 0);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Item removed from pages.cart successfully")));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: Icon(
                                      Icons.remove_circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("Price Rp{d.price.toString()}"),
                        ],
                      ),
                    ))
              ],
            ),
          ),

          Row(children: <Widget>[
            buildButton(
              icon: Icons.remove,
              press: () {
                Get.find<HomePageController>()
                    .removeFromCart(d.shopId ?? 0);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        "Item removed from pages.cart successfully")));
                if (numOfItems > 1) {
                  setState(() {
                    numOfItems--;
                  });
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
              child: Text(
                // if our item is less  then 10 then  it shows 01 02 like that
                numOfItems.toString().padLeft(2, "0"),
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            buildButton(
                icon: Icons.add,
                press: () {
                  setState(() {
                    numOfItems++;
                  });
                }),
          ],
          ),


          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                //child: Image.asset(cart.item.image),
              ),
            ),
          ),
        ]
      );
    }

  getItemTotal(List<ItemModel> items) {
    double sum = 0.0;
    items.forEach((e) {
      sum += e.price;
    });
    return "\Rp$sum";
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomePageController>();
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: ListView.builder(
        itemCount: carts.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
            children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: GetBuilder<HomePageController>(
                          builder: (_) {
                            if (controller.cartItems.length == 0) {
                              return Center(
                                child: Text("No item found"),
                              );
                            }
                            return ListView(
                              shrinkWrap: true,
                              children: controller.cartItems
                                  .map((d) => generateCartBody(context, d))
                                  .toList(),
                            );
                          },
                        ),
                      ),
                    ),
              // Row(
              //   children: [
              //     Spacer(),
              //     IconButton(
              //       icon: Icon(Icons.restore_from_trash_rounded),
              //       onPressed: () {},
              //     ),
              //   ],
              // ),
            ]
            ),
        )
      )
    );
  }
}
        SizedBox buildButton({IconData? icon, VoidCallback? press}) {
          return SizedBox(
            width: 40,
            height: 32,
            child: FloatingActionButton(
              onPressed: press,
              child: Icon(icon),
            ),
          );
        }


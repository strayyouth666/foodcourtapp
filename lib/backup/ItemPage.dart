import 'package:foodcourtapp/controller/homepageController.dart';
//import 'package:foodcourtapp/pages/HomePage.dart';
import 'package:foodcourtapp/models/ModelItem.dart';
import 'package:foodcourtapp/widgets/CustomButton.dart';
import 'package:foodcourtapp/widgets/DotWidget.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class ItemPage extends StatefulWidget {
  final int itemId;

  ItemPage({required this.itemId});

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  late PageController pageController;
  int active = 0;
  String image=
      "https://asset.kompas.com/crops/DC-c9eBUSm31kFev0XD9216zozk=/62x0:746x456/750x500/data/photo/2022/02/01/61f954e150b0b.jpg";

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  Widget buildDot(int index, int num) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        height: 10.0,
        width: 10.0,
        decoration: BoxDecoration(
            color: (num == index) ? Colors.black38 : Colors.grey[200],
            shape: BoxShape.circle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.find<HomePageController>();
    ItemModel item = controller.getItem(widget.itemId);

    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      print(index);
                      setState(() {
                        active = index;
                      });
                    },
                    children: <Widget>[
                      Image.network(
                        item.image,
                        height: 150.0,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DotWidget(
                      activeIndex: active,
                      dotIndex: 0,
                    ),
                  ],
                ),
              ],
            ),
          ),

          GetBuilder<HomePageController>(builder: (value) {
            return Container(
                height: 270.0,
                alignment: Alignment(1.0,1.0),
                child: Padding (
                  padding: EdgeInsets.only(right: 15.0),
                  child: Column(
                    verticalDirection: VerticalDirection.down,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          controller.setToFav(item.id, !item.fav);
                          var msg = "";
                          if (item.fav) {
                            msg = "${item.name} marked as favourite";
                          } else {
                            msg = "${item.name} removed from favourite";
                          }
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(msg)));
                        },
                        child: item.fav
                            ? Icon(
                          Icons.favorite,
                          size: 20.0,
                          color: Colors.red,
                        )
                            : Icon(
                          Icons.favorite_border,
                          size: 20.0,
                        ),
                      )
                    ],
                  ),
                ));
          }),

          Divider(
            color: Colors.grey[300],
            height: 1.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  item.name,
                  style:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: 19.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                      "Flutter: Bubble tab indicator for TabBar. Using a Stack Widget and then adding elements to stack on different levels(stacking pages.home.pages.detail.pages.cart.components like Tabs, above"),
                )
              ],
            ),
          ),
        ],
      ),

      // bottomNavigationBar: Container(
      //   margin: EdgeInsets.only(bottom: 18.0),
      //   height: 60.0,
      //   decoration: BoxDecoration(
      //       color: Colors.white,
      //       border: Border(
      //           top: BorderSide(color: Colors.grey.shade300, width: 1.0))),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: <Widget>[
      //       Container(
      //         child: Row(
      //           children: <Widget>[
      //             Container(
      //               width: 60.0,
      //               child: Text(
      //                 "Total Amount",
      //                 style: TextStyle(fontSize: 12.0, color: Colors.grey),
      //               ),
      //             ),
      //             Text("\Rp${item.price.toString()}",
      //                 style: TextStyle(
      //                     fontSize: 25.0, fontWeight: FontWeight.w600)),
      //           ],
      //         ),
      //       ),
      //       GetBuilder<HomePageController>(builder: (_) {
      //         bool isAdded = controller.isAlreadyInCart(item.id);
      //         if (isAdded) {
      //           return CustomButton(
      //             name: "REMOVE CART",
      //             onTap: () async {
      //               try {
      //                 controller.removeFromCart(item.id);
      //                 ScaffoldMessenger.of(context)
      //                     .showSnackBar(SnackBar(content: Text("Item removed from pages.cart successfully")));
      //               } catch (e) {
      //                 print(e);
      //               }
      //             },
      //           );
      //         }
      //         return CustomButton(
      //           name: "ADD TO CART",
      //           onTap: controller.isLoading ? null : ()  async {
      //             try {
      //               var result = await controller.addToCart(item);
      //               controller.getCardList();
      //               ScaffoldMessenger.of(context)
      //                   .showSnackBar(SnackBar(content: Text("Item added in pages.cart successfully")));
      //             } catch (e) {
      //               print(e);
      //             }
      //           },
      //         );
      //       })
      //  ]
      //   )
      // )
        );
  }
}

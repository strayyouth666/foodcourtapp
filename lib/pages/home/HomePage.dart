import 'package:flutter/material.dart';
import 'package:foodcourtapp/controller/homepageController.dart';
import 'package:foodcourtapp/pages/home/components/body.dart';
import 'package:get/get.dart';


class HomePage extends StatefulWidget {
  //final controller = HomePageController();
  // final counterC = Get.put(HomePageController());
  //final ItemModel item;
  //HomePage({Key? key, required this.item,}) : super(key: key);

  @override
  HomePageState createState() => new HomePageState();
  //(item);
}

class HomePageState extends State<HomePage> {
  static const String id ='home-screen';
  //ItemModel item;
  //HomePageState(this.item);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }



  // AppBar buildAppBar(BuildContext context) {
  //   return AppBar(
  //     backgroundColor: Colors.white,
  //     elevation: 0,
  //     // leading: IconButton(
  //     //   icon:  const Icon(Icons.arrow_back),
  //     //   onPressed: () {},
  //     //   color: kTextColor,
  //     // ),
  //     actions: <Widget>[
  //       IconButton(
  //         icon: const Icon(Icons.search),
  //         onPressed: () {
  //           showSearch(
  //           context: context, delegate: CustomSearchDelegate());
  //         },
  //         color: kTextColor,
  //         ),
  //       // IconButton(
  //       //   icon: const Icon(Icons.shopping_cart),
  //       //   onPressed: () => Get.to(CartScreen(item: item)),
  //       //       // Navigator.push(context,
  //       //       // MaterialPageRoute(builder: (context) => CartScreen(),
  //       //     // By default our  icon color is white
  //       //   // )),
  //       //   color: kTextColor,
  //       // ),
  //     SizedBox(width: kDefaultPadding / 2)
  //     ],
  //   );

  }

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(
          () => HomePageController());
}
  }
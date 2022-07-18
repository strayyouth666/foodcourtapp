
// import 'dart:ui';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:foodcourtapp/models/ItemModel.dart';
// import 'package:foodcourtapp/pages/cart/cart_screen.dart';
import 'package:foodcourtapp/pages/home/components/banner.dart';
// import 'package:foodcourtapp/pages/home/components/categories.dart';
import 'package:flutter/material.dart';
import 'package:foodcourtapp/pages/detail/ItemDetail.dart';
import 'package:foodcourtapp/category/categorywidget.dart';
import 'package:foodcourtapp/pages/home/components/header.dart';
import 'package:foodcourtapp/pages/home/components/home_product.dart';
import 'package:foodcourtapp/product/feature_product.dart';
// import 'package:foodcourtapp/pages/profile/profilepage.dart';
// import 'package:foodcourtapp/pages/scan/scanpage.dart';
// import 'package:foodcourtapp/pages/home/components/header.dart';
import 'package:foodcourtapp/widgets/constants.dart';
import 'package:foodcourtapp/pages/home/components/item_card.dart';
// import 'package:foodcourtapp/widgets/default_button.dart';
// import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/status/http_status.dart';

// import '../HomePage.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:foodcourtapp/pages/home/components/header.dart';

class Body extends StatefulWidget{
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(

          bottom: false,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HomeHeader(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Text(
              "Most Pick",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
        ),
             BannerWidget(),
              SizedBox(height: 10,),
              CategoryWidget(),
              SizedBox(height: 10,),
              HomeProductList(),
              SizedBox(height: 10,),
              FeaturedProduct(),
            //   Expanded(
            //    child: Padding(
            //      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            //      child: GridView.builder(
            //        itemCount: product.length,
            //        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //          crossAxisCount: 2,
            //          mainAxisSpacing: kDefaultPadding,
            //          crossAxisSpacing: kDefaultPadding,
            //          childAspectRatio: 0.75,
            //        ),
            //        itemBuilder: (context, index) =>
            //            ItemCard(item: product[index],
            //              press: () => Navigator.push(context,
            //                MaterialPageRoute(builder: (context) =>
            //                    ItemDetail(item: product[index],
            //                      //itemId:
            //                    )),
            //               ),
            //             ),
            //
            //   ),
            // ),
            // ),

            //   BottomAppBar(
            //     child: Container(
            //       child: Row(
            //       //mainAxisSize: MainAxisSize.max,
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       //crossAxisAlignment: CrossAxisAlignment.start,
            //       children: <Widget>[
            //         //SizedBox(width: 110,),
            //         SizedBox(height: 100,),
            //                       // MaterialButton(
            //                       //   shape: RoundedRectangleBorder(
            //                       //       borderRadius: BorderRadius.circular(16)),
            //                       //   color: item.color,
            //                       //   onPressed: () {
            //                       //     Get.to(HomePage());
            //                       //   },
            //                       //   child: SvgPicture.asset(
            //                       //     'assets/pict/bx_bx-home-alt.svg',),
            //                       // ),
            //
            //         // ElevatedButton(
            //         //   onPressed: () {
            //         //     //Get.to(HomePage());
            //         //   },
            //         //   child: SvgPicture.asset(
            //         //     'assets/pict/bx_bx-home-alt.svg',),
            //         // ),
            //
            //
            //         // SizedBox(width: 30,),
            //
            //         // ElevatedButton(
            //         //   onPressed: () {
            //         //     // Get.to(ScanPage());
            //         //   },
            //         //   child: SvgPicture.asset(
            //         //     'assets/pict1/ic_baseline-fiber-smart-record.svg',),
            //         // ),
            //
            //         // SizedBox(width: 30,),
            //
            //         // ElevatedButton(
            //         //   onPressed: () {
            //         //     Get.to(ProfilePage());
            //         //         //item: item));
            //         //   },
            //         //   child: SvgPicture.asset(
            //         //     'assets/pict/Vector.svg',),
            //         // ),
            //       ],
            //     ),
            //   ),
            // )
        ]
        ),
    )),

      // bottom: false,
      //   child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: <Widget>[
      //
      //     Padding( padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      //       child: Text(
      //       "FoodCourtku",
      //       style: Theme.of(context)
      //           .textTheme
      //           .headline5!
      //           .copyWith(fontWeight: FontWeight.bold),
      //     ),
      //   ),
      //     Categories(),
      //     Expanded(
      //       child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      //        child: GridView.builder(
      //         itemCount: product.length,
      //
      //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //           crossAxisCount: 2,
      //           mainAxisSpacing: kDefaultPadding,
      //           crossAxisSpacing: kDefaultPadding,
      //           childAspectRatio: 0.75,
      //         ),
      //         itemBuilder: (context, index) =>
      //             ItemCard(item: product[index],
      //                 press: () => Navigator.push(context,
      //                     MaterialPageRoute(builder: (context) =>
      //                         ItemDetail(item: product[index],
      //                             //itemId:
      //                           )),
      //           ),
      //         ),
      //
      //       ),
      //     ),
      //     ),
      //   ]
      //   )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:foodcourtapp/pages/vendor/vendor_appbar.dart';
import 'package:foodcourtapp/pages/vendor/vendor_banner.dart';
import 'package:foodcourtapp/product/feature_product.dart';

class VendorPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return[
            // VendorrAppBar(),
          ];
        },
        body: ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            VendorBanner(),
            // Expanded(
            //     child: ()VendorCategories()),
            FeaturedProduct()
          ],
        ),
      ),
    );
  }
}
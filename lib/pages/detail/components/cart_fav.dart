import 'package:flutter/material.dart';
import 'package:foodcourtapp/controller/homepageController.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodcourtapp/models/ModelItem.dart';
import 'package:foodcourtapp/pages/detail/components/cart_count.dart';
import 'package:foodcourtapp/widgets/constants.dart';
import 'package:get/get.dart';
// import 'package:foodcourtapp/models/ModelItem.dart';

class CounterWithFavBtn extends StatefulWidget {
  final ItemModel item;
  CounterWithFavBtn({Key? key, required this.item}) : super(key: key);

  @override
  CounterWithFavBtnState createState() => new CounterWithFavBtnState(item);
}

class CounterWithFavBtnState extends State<CounterWithFavBtn> {
  ItemModel item;
  CounterWithFavBtnState(this.item);
  HomePageController controller = Get.find<HomePageController>();
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[

        GetBuilder<HomePageController>(builder: (value) {
          return Container(
              alignment: Alignment(1.0, 1.0),
              child: Padding(
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
        })
      ],
    );
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
}
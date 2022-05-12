import 'package:flutter/material.dart';
import 'package:foodcourtapp/models/ModelItem.dart';
//import 'package:foodcourtapp/pages/home/pages.cart.components/body.dart';
import 'package:foodcourtapp/widgets/constants.dart';

class Categories extends StatefulWidget {

  // const Categories({Key? key,
  //   //required this.itemId
  // }) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  List<String> categories = ["McDonalds", "EsTeh Indonesia", "Janji Jiwa", "Kebab Turki", "KFC"];
  // berdasarkan default item pertama yang kita akan pilih

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
          // {
          //   return ListTile(
          //     //title: Text('${item.stand}'),
          //     tileColor: selectedIndex == index?  Colors.grey: null,
          //     onTap: () {
          //       setState(() {
          //         selectedIndex = index;
          //       });
          //     }
          //   );
          // }
        ),
      ),
    );
  }
  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? kTextColor : kTextLightColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPadding / 4), //top padding 5
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}



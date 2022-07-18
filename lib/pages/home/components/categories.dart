import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:foodcourtapp/models/ItemModel.dart';
//import 'package:foodcourtapp/pages/home/pages.cart.components/body.dart';
import 'package:foodcourtapp/widgets/constants.dart';
// import '../../../widgets/size_config.dart';

class Categories extends StatefulWidget {
  // final ItemModel item;
  // const Categories({Key? key, required this.item}) : super(key: key);

  @override
  CategoriesState createState() => new CategoriesState();
}

class CategoriesState extends State<Categories> {
  // ItemModel item;
  //
  // CategoriesState(this.item);

  List<String> categories = [
    "Menu",
    "McDonalds",
    "Es Teh Indonesia",
    "Janji Jiwa",
    "Kebab Turki",
    "KFC",
    "Soto Cak Har",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        child: SizedBox(
          height: 25,
        child: Row(
    children: [
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) => Card(),
          ),

        SizedBox(
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
      ],
    )
    )
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










//
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children:[
//             ListView.builder(
//               //shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//                itemCount: categories.length,
//                itemBuilder: (BuildContext context, int index) =>
//                   CategoryCard(
//                     text: categories[index]["text"],
//                     press: () {},
//                   )
//           ),
//         ]
//         )
//     );
//   }
// }
//
// class CategoryCard extends StatelessWidget {
//   const CategoryCard({
//     Key? key,
//     required this.text,
//     required this.press,
//   }) : super(key: key);
//
//   final String? text;
//   final GestureTapCallback press;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: press,
//       child: SizedBox(
//        width: 55,
//         child: Column(
//           children: [
//             Container(
//               //padding: EdgeInsets.all(20),
//               height: 5,
//               width: 5,
//               decoration: BoxDecoration(
//                 color: Color(0xFFFFECDF),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               //child: SvgPicture.asset(icon!),
//             ),
//             Text(text!, textAlign: TextAlign.center)
//           ],
//         ),
//       ),
//     );
//   }
// }
      // child: SizedBox(
      //   height: 25,
        // child: ListView.builder(
        //   shrinkWrap: true,
        //   scrollDirection: Axis.horizontal,
        //   itemCount: categories.length,
        //   itemBuilder: (BuildContext context, int index) => Card(index),
        //
        //     child: ListTile(
        //       title: Text('$item.stand}'),
        //       tileColor: selectedIndex == index?  Colors.grey: null,
        //       onTap: () {
        //         setState(() {
        //           selectedIndex = index;
        //         });
        //       }
        //     ),
        // ),
      // );
  // }
//
//   Widget buildCategory(int index) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedIndex = index;
//         });
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               categories[index],
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: selectedIndex == index ? kTextColor : kTextLightColor,
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: kDefaultPadding / 4), //top padding 5
//               height: 2,
//               width: 30,
//               color: selectedIndex == index ? Colors.black : Colors.transparent,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';

import 'package:foodcourtapp/models/ItemModel.dart';

import 'package:foodcourtapp/models/ModelItem.dart';

import 'package:foodcourtapp/widgets/constants.dart';

class ItemCard extends StatelessWidget {
  final ItemModel item;
  final VoidCallback press;
  const ItemCard({
    Key? key,
    required this.item,
    required this.press,
  }) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Expanded(
            child: Container(
          padding: EdgeInsets.all(kDefaultPadding),
          decoration: BoxDecoration(
            color: item.color,
            borderRadius: BorderRadius.circular(18),
          ),
              child: Hero(
                tag: "${item.id}",
                child: Image.asset(item.image),
          ),
            ),
          ),

          Padding(padding: const EdgeInsets.symmetric(vertical:  kDefaultPadding / 4),
            child: Text(
              item.name,
              style: TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            "Rp${item.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      )
    );
  }
}

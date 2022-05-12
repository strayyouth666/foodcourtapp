import 'package:flutter/material.dart';
import 'package:foodcourtapp/models/ModelItem.dart';
import 'package:foodcourtapp/widgets/constants.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            item.stand,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            item.name,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: kDefaultPadding),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Price\n"),
                    TextSpan(
                      text: "\Rp${item.price}",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: kDefaultPadding),
              Expanded(
                child: Hero(
                  tag: "${item.id}",
                  child: Image.asset(
                    item.image,
                    //height: 140,
                    //width: 30,
                    fit: BoxFit.fill
                    ,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
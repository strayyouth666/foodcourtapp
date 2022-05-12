import 'package:flutter/material.dart';
import 'package:foodcourtapp/models/ModelItem.dart';
import 'package:foodcourtapp/widgets/constants.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Text(
        item.description,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
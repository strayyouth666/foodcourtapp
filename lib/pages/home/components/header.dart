import 'package:flutter/material.dart';
import 'package:foodcourtapp/widgets/constants.dart';
import 'package:foodcourtapp/models/ModelItem.dart';

class HomeHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: headerHeight,
      color: Colors.white,
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good Morning!",
                style: Theme.of(context).textTheme.caption,
              ),
              Text("Albert",
                //user.name,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.black54),
              )
            ],
          ),
          CircleAvatar(
            backgroundColor: Colors.transparent,
            //backgroundImage: AssetImage("assets/images/profile.png"),
          )
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodcourtapp/widgets/constants.dart';
// import 'package:foodcourtapp/models/ItemModel.dart';

class HomeHeader extends StatefulWidget {

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  final firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

 getUserName() async {
    final CollectionReference users = firestore.collection('users');
    final String uid = auth.currentUser!.uid;
    final result = await users.doc(uid).get();
    return result['name'];
  }


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
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.black),

              ),
              // FutureBuilder(
              //   future: getUserName(),
              //   builder: (_ , AsyncSnapshot snapshot){
              //
              //     if(snapshot.connectionState == ConnectionState.waiting){
              //       return Center( child: CircularProgressIndicator());
              //     }
              //     return Text(snapshot.data);
              //   },
              // ),
              // Text("Albert",
              //   //user.name,
              //   style: Theme.of(context)
              //       .textTheme
              //       .titleLarge!
              //       .copyWith(color: Colors.black),
              // )

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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:foodcourtapp/product/product_detail.dart';
import 'package:foodcourtapp/services/firebase_services.dart';

class FeaturedProduct extends StatelessWidget {
  const FeaturedProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    FirebaseServices _services = FirebaseServices();

    return FutureBuilder<QuerySnapshot>(
      future: _services.subCategories.where('active',isEqualTo: true).get(),
          // .where('collection',isEqualTo: 'Featured Products').get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        if(snapshot.data!.docs.isEmpty){
          return Container(); //if no data
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(4),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.teal[100],
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text('Featured Products',style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2.0,2.0),
                          blurRadius: 3.0,
                          color: Colors.black,
                        ),
                      ],
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),),
                  ),

                ),
              ),
            ),
            new ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                return new ProductDetail(document: document,);
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}

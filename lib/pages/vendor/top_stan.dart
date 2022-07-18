import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodcourtapp/services/stan_service.dart';
import 'package:foodcourtapp/services/user_services.dart';

class TopPickedStan extends StatefulWidget {
  const TopPickedStan({Key? key}) : super(key: key);

  @override
  _TopPickedStanState createState() => _TopPickedStanState();
}

class _TopPickedStanState extends State<TopPickedStan> {
  StanServices _stanServices = StanServices();
  UserServices _userServices = UserServices();
  User? user = FirebaseAuth.instance.currentUser;
  var _userLatitude = 0.0;
  var _userLongitude = 0.0;


  @override
  void initState(){
    _userServices.getUserById(user!.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: _stanServices.getTopPickedStan(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapShot){
        if(!snapShot.hasData)return CircularProgressIndicator();
        return Column(
          children: [
            Flexible(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: snapShot.data!.docs.map((DocumentSnapshot document){
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                    width: 80,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: Card(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                                child: Image.network(document['image'],fit: BoxFit.cover,)),

                          ),
                        ),
                        Container(
                          child: Text(
                            document['shopName'],style: TextStyle(
                            fontSize: 14,fontWeight: FontWeight.bold,
                          ),maxLines: 2, overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ));
                }).toList(),
              ),
            )
          ],
        );

        },
      ),
    );
  }
}

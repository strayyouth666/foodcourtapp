import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

class UserModel {

  static const NUMBER = 'number';
  static const ID = 'id';

  String _number='';
  String _id='';

  //getter
  String get number =>_number;
  String get id =>_id;

  UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot){
    _number = snapshot.data()![NUMBER];
    _id = snapshot.data()![ID];
  }







//   String userName,
//       userEmail,
//       userGender,
//       userPhoneNumber,
//       userImage,
//       userAddress;
//
//
//
//   UserModel(
//       {required this.userEmail,
//         required this.userImage,
//         required this.userAddress,
//         required this.userGender,
//         required this.userName,
//         required this.userPhoneNumber});

 }
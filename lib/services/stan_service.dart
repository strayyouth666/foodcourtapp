import 'package:cloud_firestore/cloud_firestore.dart';

class StanServices{
  getTopPickedStan(){
    return FirebaseFirestore.instance.collection('vendors').where
      ('accVerified', isEqualTo: true).where('isTopPicked', isEqualTo: true).orderBy('shopName').snapshots();
  }
}
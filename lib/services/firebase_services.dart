import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices{
  CollectionReference homeBanner = FirebaseFirestore.instance.collection('homeBanner');
  CollectionReference categories = FirebaseFirestore.instance.collection('categories');
  CollectionReference mainCategories = FirebaseFirestore.instance.collection('mainCategories');
  CollectionReference subCategories = FirebaseFirestore.instance.collection('subCategories');
  // firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
}

// Future<String> uploadImage(XFile? file, String reference) async{
//
// }
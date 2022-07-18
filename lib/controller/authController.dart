// import 'dart:async';
// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodcourtapp/pages/beranda/main_screen.dart';
import 'package:foodcourtapp/pages/beranda/on_boarding_screen.dart';
// import 'package:foodcourtapp/on_boarding_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:foodcourtapp/models/ItemModel.dart';f
// import 'package:foodcourtapp/pages/home/HomePage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:foodcourtapp/models/ModelItem.dart';
import 'package:foodcourtapp/pages/beranda/loginpage.dart';
// import 'package:foodcourtapp/pages/home/HomePage.dart';
import 'package:foodcourtapp/widgets/constants.dart';
import 'package:get/get.dart';
// import 'package:foodcourtapp/services/itemServices.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import '../models/ItemModel.dart';
// import '../pages/beranda/loginpage.dart';
// import '../widgets/constants.dart';

class AuthController extends GetxController {

  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;
  late Rx<GoogleSignInAccount?> googleSignInAccount;
  bool isSwitched = false;


  // final ItemModel item;
  // AuthController({Key? key, required this.item,});


  @override
  void onReady() {
    super.onReady();

    firebaseUser = Rx<User?>(auth.currentUser);
    googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);


    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);


    googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    ever(googleSignInAccount, _setInitialScreenGoogle);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(LoginPage());
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAll(MainScreen());
      //(item:item));
    }
  }

  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    print(googleSignInAccount);
    if (googleSignInAccount == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(LoginPage());
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAll(OnBoardingScreen());
    }
  }

  // GET UID
  // Future<String> getCurrentUID() async {
  //   return (await firebaseUser.currentUser()).uid;
  // }

  // GET CURRENT USER
  // Future getCurrentUser() async {
  //   return await auth.currentUser();
  // }


  void signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await auth
            .signInWithCredential(credential)
        // ignore: invalid_return_type_for_catch_error
            .catchError((onErr) => print(onErr));
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e.toString());
    }
  }

  void register(String email, String password, String username,
      String fullname) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.back();
    } catch (e) {
      Get.snackbar(
        "Error sign up in",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "Error login in",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    await auth.signOut();
  }


  @override
  void onClose() {
    //super.onClose();
    // _humiditySubs.cancel();
    // _temperatureSubs.cancel();
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foodcourtapp/controller/authController.dart';
import 'package:google_sign_in/google_sign_in.dart';

const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);
const kPrimaryColor = Color(0xFF19DAEC);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kSecondaryColor = Color(0xFF979797);

const kDefaultPadding = 20.0;
const cartBarHeight = 100.0;
const headerHeight = 85.0;


const kPageViewTextStyle = TextStyle(
  fontSize: 25, fontWeight: FontWeight.w600,
);

const kApiKey = 'AIzaSyBhHHqXdSjKpUnpLPQHuAXmVqKeH0u_FHM';

const panelTransition = Duration(milliseconds: 500);

AuthController authController = AuthController.instance;
FirebaseAuth auth = FirebaseAuth.instance;

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

// FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

GoogleSignIn googleSign = GoogleSignIn();

final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp(
  // options: const FirebaseOptions(
  // apiKey: 'AIzaSyDtfeMndF_TdL94aJDK-UdQFybV9JfcqNo',
  // appId: '1:904497427586:android:4bc50dc88d3bcae00d709b',
  // messagingSenderId: '904497427586',
  // projectId: 'waletku-4ad61',
  // databaseURL: 'https://waletku-4ad61-default-rtdb.asia-southeast1.firebasedatabase.app/',
  // ),
);
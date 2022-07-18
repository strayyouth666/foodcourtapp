import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodcourtapp/services/user_services.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../pages/home/HomePage.dart';

class AuthProvider extends ChangeNotifier {
  File? image;
  bool isPicAvail = false;
  String pickedError = '';
  String error = '';
  UserServices _userServices = UserServices();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String? smsOtp;
  String? verificationId;
  // StoreServices _storeServices = StoreServices();
  String? selectedStore;
  String? selectedStoreId;



  Future<void> verifyPhone(BuildContext context, String number) async {
    final PhoneVerificationCompleted verificationCompleted = (
        PhoneAuthCredential credential) async {
      await _auth.signInWithCredential(credential);
    };

    final PhoneVerificationFailed verificationFailed = (
        FirebaseAuthException e) {
      print(e.code);
    };

    final PhoneCodeSent smsOtpSend = (String verId, int resendToken) async {
      this.verificationId = verId;

      //print('Inside code sent');

      smsOtpDialog(context, number);
    } as PhoneCodeSent;
      // {
      //   print('Signed in');
      // });

      //open dialog to enter received OTP SMS

      //smsOtpDialog(context, number);
    // }


    try {
      _auth.verifyPhoneNumber(
        phoneNumber: number,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: smsOtpSend,
        codeAutoRetrievalTimeout: (String verId){
          this.verificationId = verId;
        },
      );
    } catch (e) {
      print(e);
    }
  }


    Future<bool?> smsOtpDialog(BuildContext context, String number) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Column(
                children: [
                  Text('Verification Code'),
                  SizedBox(height: 6,),
                  Text('Enter 6 digit OTP received as SMS',
                    style: TextStyle(color: Colors.grey, fontSize: 12),),
                ],
              ),
              content: Container(
                height: 90,
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  onChanged: (value) {
                    this.smsOtp = value;
                  },
                ),
              ),
              actions: [
                MaterialButton(
                  onPressed: () async {
                    try {
                      PhoneAuthCredential phoneAuthCredential =
                      PhoneAuthProvider.credential(
                          verificationId: verificationId!, smsCode: smsOtp!);

                      final User? user = (await _auth.signInWithCredential(
                          phoneAuthCredential)).user;

                      //create user data in firestore after user succesfully registered
                      _createUser(id: user!.uid,number: user.phoneNumber);
                      //navigate to homepage after login
                      if (user!=null) {
                        Get.offAll(() => HomePage());
                      } else {
                        print('login failed');
                      }
                    } catch (e) {
                      this.error = 'Invalid OTP';
                      notifyListeners();
                      print(e.toString());
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Done'),
                ),
              ],
            );
          }
      );
    }

  Future<File> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      this.image = File(pickedFile.path);
      notifyListeners();
    } else {
      this.pickedError = 'No image selected.';
      print('No image selected.');
      notifyListeners();
    }
    return pickImage();
  }

  void _createUser({String? id, String? number}) {
    _userServices.createUserData({
      'id': id,
      'number': number,
    });
  }


}

// import 'package:flutter/material.dart';
// import 'package:foodcourtapp/pages/beranda/main_screen.dart';
// import 'package:foodcourtapp/Maps/map_screen.dart';
// // import 'package:foodcourtapp/pages/home/HomePage.dart';
// import 'package:foodcourtapp/services/AuthProvider.dart';
// import 'package:foodcourtapp/services/location_provider.dart';
// import 'package:get/get.dart';
// // import 'package:get/get_core/src/get_main.dart';
// import 'package:provider/provider.dart';
// // import 'package:foodcourtapp/services/AuthProvider.dart.dart';
//
// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     final auth = Provider.of<AuthProvider>(context);
//     bool _validPhoneNumber = false;
//     var _phoneNumberController = TextEditingController();
//
//     void showBottomSheet(context){
//       showModalBottomSheet(
//           context: context,
//           builder: (context)=> StatefulBuilder(
//               builder: (BuildContext context,StateSetter myState) {
//                 return Container(
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Visibility(
//                           visible: auth.error== 'Invalid OTP'? true: false,
//                           child: Container(
//                             child: Column(
//                               children: [
//                                 Text(auth.error),
//                                 SizedBox(height: 3,),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Text('Login',
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold),
//                         ),
//                         Text('Enter your phone number to proceed',
//                           style: TextStyle(fontSize: 12, color: Colors.grey),),
//                         SizedBox(height: 25),
//                         TextField(
//                           decoration: InputDecoration(
//                             prefixText: '+62',
//                             labelText: 'your mobile number',
//                           ),
//                           autofocus: true,
//                           keyboardType: TextInputType.phone,
//                           maxLength: 10,
//                           controller: _phoneNumberController,
//                           onChanged: (value) {
//                             if (value.length == 12) {
//                               myState(() {
//                                 _validPhoneNumber = true;
//                               });
//                             }else{
//                               myState((){
//                                 _validPhoneNumber = false;
//                               });
//                             }
//                           },
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                             children: [
//                               Expanded(child:
//                               AbsorbPointer(
//                                 absorbing: _validPhoneNumber ? false : true,
//                                 child: MaterialButton(
//                                     color: _validPhoneNumber ? Theme
//                                         .of(context)
//                                         .primaryColor : Colors.grey,
//                                     child: Text(_validPhoneNumber
//                                         ? 'CONTINUE'
//                                         : 'ENTER PHONE NUMBER',),
//                                     onPressed: () {
//                                       String number = '+62${_phoneNumberController
//                                           .text}';
//                                       auth.verifyPhone(context, number);
//                                     }
//                                 ),
//                               ),
//                               ),
//                             ]),
//                       ],
//                     ),
//                   ),
//                 );
//               }
//               ),
//             );
//       }
//       final locationData = Provider.of<LocationProvider>(context, listen: false);
//       return Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Stack(
//             children: [
//               Positioned(
//                 right: 0.0,
//                 top: 10.0,
//                 child: MaterialButton(
//                   child: Text(
//                     'Skip',
//                     style: TextStyle(color: Colors.redAccent),
//                   ),
//                   onPressed: (){},
//                 ),
//               ),
//                 Column(
//                   children: [
//                     Expanded(
//                       child: MainScreen(),
//                     ),
//                     SizedBox(height: 20,),
//                     MaterialButton(
//                       color: Colors.deepPurpleAccent,
//                       child: Text('Your Location'),
//                       onPressed: ()async{
//                         await locationData.getCurrentPosition();
//                         if(locationData.permissionAllowed==true){
//                             Get.to(MapScreen());
//                         }else{
//                           print('Permission not allowed');
//                         }
//                       },
//                     ),
//                     Text('Ready to order your favourite food?'),
//                     SizedBox(height: 20,),
//                     MaterialButton(
//                       child: RichText(
//                         text: TextSpan(
//                           text: 'Already a Customer?',
//                           style: TextStyle(color: Colors.grey),
//                           children: [
//                         TextSpan(
//                             text: 'Login',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.redAccent)),
//                       ],
//                     ),
//                   ),
//                   onPressed: (){
//                     showBottomSheet(context);
//                   },
//                 ),
//               ])
//             ],
//           ),
//         ),
//       );
//   }
// }
//

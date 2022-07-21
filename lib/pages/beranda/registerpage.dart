// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:foodcourtapp/controller/authController.dart';
// import 'package:foodcourtapp/pages/beranda/loginpage.dart';
// import 'package:foodcourtapp/widgets/constants.dart';
// import 'package:get/get.dart';
//
//
// class RegisterPage extends GetView<AuthController> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _fullnameController = TextEditingController();
//   final TextEditingController _usernameController = TextEditingController();
//
//   late final InputBorder? enabledBorder;
//   late final TextStyle? floatingLabelStyle;
//   late final TextStyle? labelStyle;
//
//   @override
//   Widget build(BuildContext context) {
//     //var size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 10,
//         backgroundColor: Colors.blueGrey,
//       ),
//
//       extendBodyBehindAppBar: true,
//       body: SingleChildScrollView(
//         // children: <Widget>[
//
//         child: Container(
//           //height: MediaQuery.of(context).size.height /2,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(50.0),
//             image: DecorationImage(
//               alignment: Alignment.topCenter,
//               image: AssetImage('assets/pict3/unsplash_SzcO_chuZoE.png'),
//               fit: BoxFit.fitWidth,
//               scale: 0.4,
//             ),
//           ),
//           child: Padding(
//             padding: EdgeInsets.all(20),
//             child: Column(
//               //mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//
//                 SizedBox(height: 500,),
//                 //SizedBox(width: 100,),
//
//                 SvgPicture.asset(
//                   'assets/pict3/Sign Up.svg',),
//
//                 SizedBox(height: 10),
//
//                 FadeInUp(
//                   delay: Duration(milliseconds: 800),
//                   duration: Duration(milliseconds: 1500),
//                   child: TextField(
//                     cursorColor: Colors.black,
//                     decoration: InputDecoration(
//                         labelText: 'Your Name',
//                         hintText: 'Full Name',
//                         labelStyle: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w100
//                         ),
//                         prefixIcon: Icon(Icons.account_circle,color: Colors.black,size: 18,),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.blueGrey.shade200, width: 2),
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         // floatingLabelStyle: TextStyle(
//                         //   color: Colors.black,
//                         //   fontSize: 18,
//                         // ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black, width: 1.5),
//                           borderRadius: BorderRadius.circular(30),
//                         )
//                     ),
//                     controller: _fullnameController,
//                   ),
//                 ),
//
//                 SizedBox(height: 15),
//
//                 FadeInUp(
//                   delay: Duration(milliseconds: 800),
//                   duration: Duration(milliseconds: 1500),
//                   child: TextField(
//                     cursorColor: Colors.black,
//                     decoration: InputDecoration(
//                         labelText: 'Email Address',
//                         hintText: 'insert your email',
//                         labelStyle: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w100
//                         ),
//                         prefixIcon: Icon(Icons.account_circle,color: Colors.black,size: 18,),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.blueGrey.shade200, width: 2),
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         // floatingLabelStyle: TextStyle(
//                         //   color: Colors.black,
//                         //   fontSize: 18,
//                         // ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black, width: 1.5),
//                           borderRadius: BorderRadius.circular(30),
//                         )
//                     ),
//                     controller: _emailController,
//                   ),
//                 ),
//
//                 SizedBox(height: 15),
//
//                 FadeInUp(
//                   delay: Duration(milliseconds: 800),
//                   duration: Duration(milliseconds: 1500),
//                   child: TextField(
//                     cursorColor: Colors.black,
//                     decoration: InputDecoration(
//                         labelText: 'Username',
//                         hintText: 'insert your username',
//                         labelStyle: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w100
//                         ),
//                         prefixIcon: Icon(Icons.account_circle,color: Colors.black,size: 18,),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.blueGrey.shade200, width: 2),
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         // floatingLabelStyle: TextStyle(
//                         //   color: Colors.black,
//                         //   fontSize: 18,
//                         // ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black, width: 1.5),
//                           borderRadius: BorderRadius.circular(30),
//                         )
//                     ),
//                     controller: _usernameController,
//                   ),
//                 ),
//
//                 SizedBox(height: 15),
//                 FadeInUp(
//                   delay: Duration(milliseconds: 800),
//                   duration: Duration(milliseconds: 1500),
//                   child: TextField(
//                     cursorColor: Colors.black,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                         labelText: 'Password',
//                         hintText: 'insert your password',
//
//                         labelStyle: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w100
//                         ),
//                         prefixIcon: Icon(Icons.vpn_key,color: Colors.black,size: 18,),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.blueGrey.shade200, width: 2),
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         // floatingLabelStyle: TextStyle(
//                         //   color: Colors.black,
//                         //   fontSize: 18,
//                         // ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black, width: 1.5),
//                           borderRadius: BorderRadius.circular(30),
//                         )
//                     ),
//                     controller: _passwordController,
//                   ),
//                 ),
//                 //SizedBox(height: 5),
//                 // FadeInUp(
//                 //   delay: Duration(milliseconds: 800),
//                 //   duration: Duration(milliseconds: 1500),
//                 //   child: Row(
//                 //     mainAxisAlignment: MainAxisAlignment.end,
//                 //     children: [
//                 //       TextButton(
//                 //         onPressed: () {},
//                 //         child: Text("Lupa Password?", style: TextStyle(
//                 //           color: Colors.black,
//                 //           fontSize: 14,
//                 //           fontWeight: FontWeight.w400,
//                 //         ),
//                 //         ),
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),
//                 SizedBox(height: 30,),
//                 FadeInUp(
//                   child: MaterialButton(
//                     onPressed: () async {
//                       authController.register(_emailController.text.trim(),
//                           _passwordController.text.trim(),_usernameController.text.trim(), _fullnameController.text.trim());
//                     },
//                     height: 45,
//                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     color: Colors.blue,
//                     child: Text("Create Account", style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 14,
//                       // fontWeight: FontWeight.w400,
//                     ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 30),
//                 FadeInUp(
//                   delay: Duration(milliseconds: 800),
//                   duration: Duration(milliseconds: 1500),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Already have account?", style: TextStyle(
//                         color: Colors.grey.shade600,
//                         fontSize: 12,
//                         //fontWeight: FontWeight.w400,
//                       ),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           Get.to(LoginPage());
//                         },
//                         child: Text("Log In", style: TextStyle(
//                           color: Colors.blue,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 // SvgPicture.asset(
//                 //   'assets/pict3/Don’t have account_.svg',),
//                 // SizedBox(height: 10,),
//                 // ElevatedButton(
//                 //   onPressed: () {
//                 //     Get.to(RegisterView());
//                 //   },
//                 //   child:  SvgPicture.asset(
//                 //     'assets/pict3/Create one.svg',),
//                 // ),
//
//
//                 SizedBox(height: 20),
//                 // Row(
//                 //
//                 //   mainAxisAlignment: MainAxisAlignment.center,
//                 //   children: [
//                 //
//                 //     ElevatedButton(
//                 //       onPressed: () async {
//                 //         authController.login(_emailController.text.trim(),
//                 //             _passwordController.text.trim());
//                 //       },
//                 //       child: const Text("Sign in"),
//                 //     ),
//                 //   ],
//                 // ),
//
//
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// //       body: SizedBox(
// //         // children: <Widget>[
// //
// //         child: SingleChildScrollView(
// //          // height: MediaQuery.of(context).size.height /2,
// //           child: Container(
// //             decoration: BoxDecoration(
// //               borderRadius: BorderRadius.circular(50.0),
// //               image: DecorationImage(
// //                 alignment: Alignment.topCenter,
// //                 image: AssetImage('assets/pict3/unsplash_SzcO_chuZoE.png'),
// //                 //fit: BoxFit.fitWidth,
// //                 scale: 0.4,
// //               ),
// //             ),
// //             child: SingleChildScrollView(
// //               child: Column(
// //                 //mainAxisAlignment: MainAxisAlignment.center,
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 children: <Widget>[
// //
// //                   SizedBox(height: 520,),
// //                   //SizedBox(width: 100,),
// //
// //                   SvgPicture.asset(
// //                       'assets/pict3/Sign Up.svg',),
// //
// //                   SizedBox(height: 10,),
// //
// //                   TextField(
// //                     decoration: const InputDecoration(hintText: "Full Name"),
// //                     controller: _yournameController,
// //                   ),
// //                   SizedBox(height: 10,),
// //                   TextField(
// //                     decoration: const InputDecoration(hintText: "Email"),
// //                     controller: _emailController,
// //                   ),
// //                   SizedBox(height: 10,),
// //                   TextField(
// //                     decoration: const InputDecoration(hintText: "Username"),
// //                     controller: _usernameController,
// //                   ),
// //                   SizedBox(height: 10),
// //
// //                   TextField(
// //                     decoration: const InputDecoration(hintText: "Password"),
// //                     controller: _passwordController,
// //                     obscureText: true,
// //                   ),
// //                   SizedBox(height: 10,),
// //
// //                   SvgPicture.asset(
// //                     'assets/pict3/Don’t have account_.svg',),
// //                   SizedBox(height: 10,),
// //                   SvgPicture.asset(
// //                     'assets/pict3/Create one.svg',),
// //
// //                   SizedBox(height: 20),
// //                   Row(
// //
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //
// //                       ElevatedButton(
// //                         onPressed: () async {
// //                               authController.register(_emailController.text.trim(),
// //                                   _passwordController.text.trim());
// //                         },
// //                         child: const Text("Create Account"),
// //                       ),
// //                     ],
// //                   ),
// //
// //
// //
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
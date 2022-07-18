import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:foodcourtapp/controller/authController.dart';
import 'package:get/get.dart';

import '../../controller/homepageController.dart';
// import '../../models/ItemModel.dart';
import '../../widgets/constants.dart';
// import '../../widgets/custom_search.dart';
import '../beranda/loginpage.dart';
// import '../home/HomePage.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  // final ItemModel item;
  // ProfilePage({Key? key, required this.item}) : super(key: key);

  @override
  ProfilePageState createState() => new ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  // ItemModel item;
  // ProfilePageState(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Profile')),
        backgroundColor: Colors.black38,
        elevation: 0,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   color: Colors.white,
        //   onPressed: () => Navigator.pop(context),
        // ),
        actions: <Widget>[
          SizedBox(width: kDefaultPadding / 2)
        ],
      ),

      extendBodyBehindAppBar: false,
      body: Stack(
        children: <Widget>[
          // child: Container(
          //   decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(50.0),
          // ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        SizedBox(height: 30,),
                        SizedBox(width: 30,),
                        // Text('Profile',
                        //   textAlign: TextAlign.center,
                        //   style: TextStyle(fontSize: 20, fontWeight: FontWeight
                        //       .bold, color: Colors.black,),
                        // ),
                        SizedBox(height: 50,),
                        SizedBox(width: 22,),
                      ],
                    ),
                  ),

                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            children: [
                              Row(
                                children: <Widget>[
                                  SizedBox(width: 22,),
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        'https://www.shareicon.net/data/512x512/2016/08/18/814068_face_512x512.png'),
                                    radius: 30,
                                  ),


                                  SizedBox(width: 20,),

                                  // Container(
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //     crossAxisAlignment: CrossAxisAlignment.start,
                                  //     children: [
                                  //       SizedBox(height: 20,),
                                  //       Row(
                                  //         children: <Widget>[
                                  //           FutureBuilder(
                                  //             future: Provider
                                  //                 .of(context)
                                  //                 .auth
                                  //                 .getCurrentUser(),
                                  //             builder: (context, snapshot) {
                                  //               if (snapshot.connectionState == ConnectionState.done) {
                                  //                 return displayUserInformation(context, snapshot);
                                  //               } else {
                                  //                 return CircularProgressIndicator();
                                  //               }
                                  //             },
                                  //           )
                                  //         ],
                                  //       )
                                  //     ],
                                  //   ),
                                  // ),

                                  Container(
                                    child: Row(
                                      children: [
                                        SizedBox(height: 20,),
                                        SizedBox(width: 5,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            //SizedBox(width: 30,),
                                            Row(
                                              children: [
                                                Text('Halo, ',style: TextStyle(fontSize: 20,
                                                color: Colors.black),),
                                                Text('Muhammad Faruq',
                                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                                                  color: Colors.black),),
                                            ],
                                            ),
                                              ]
                                        ),
                                      ],
                                    ),
                                  ),

                                  // SvgPicture.asset(
                                  //   'assets/pict1/Frame 4.svg', height: 15,),

                                ],
                              ),

                            ],
                          ),

                        ),
                      ],
                    ),

                  ),


                  SizedBox(height: 42,),
                  // Container(
                  //   child: Row(
                  //     children: [
                  //       SizedBox(width: 30,),
                  //       SvgPicture.asset(
                  //         'assets/pict1/Dashboard.svg', height: 15,),
                  //
                  //
                  //     ],
                  //   ),
                  //
                  // ),
                  //
                  // Container(
                  //   child: Column(
                  //     children: [
                  //       Row(
                  //         children: [
                  //           SizedBox(height: 60,),
                  //           SizedBox(width: 50,),
                  //           //mainAxisAlignment: MainAxisAlignment.start,
                  //           //crossAxisAlignment: CrossAxisAlignment.start,
                  //           SvgPicture.asset(
                  //             'assets/pict1/ic_baseline-fiber-smart-record.svg',),
                  //           SizedBox(width: 20,),
                  //           SvgPicture.asset(
                  //             'assets/pict1/Connected Nest.svg',),
                  //           SizedBox(width: 60,),
                  //           SvgPicture.asset(
                  //             'assets/pict1/2.svg',),
                  //           SizedBox(width: 20,),
                  //           SvgPicture.asset(
                  //             'assets/pict1/ic_round-navigate-next.svg',),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // // ),
                  // Container(
                  //   child: Column(
                  //     children: [
                  //       Row(
                  //         children: [
                  //           SizedBox(height: 10,),
                  //           SizedBox(width: 50,),
                  //           SvgPicture.asset(
                  //             'assets/pict1/info.svg',),
                  //           SizedBox(width: 27,),
                  //           SvgPicture.asset(
                  //             'assets/pict1/Privacy.svg',),
                  //           SizedBox(width: 203,),
                  //           SvgPicture.asset(
                  //             'assets/pict1/ic_round-navigate-next.svg',),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Container(
                    child: Row(
                      children: [
                        Column(
                          children: [

                            //mainAxisAlignment: MainAxisAlignment.start,
                            //crossAxisAlignment: CrossAxisAlignment.start,

                            // SvgPicture.asset(
                            // 'assets/pict1/Dashboard.svg', height: 16,),
                            SizedBox(height: 40,),

                            // SvgPicture.asset(
                            //   'assets/pict1/Switch Account.svg', height: 16,),

                            // TextButton(
                            //   onPressed: () {},
                            //   child: Text("Switch Account", style: TextStyle(
                            //   color: Colors.lightBlue.shade600,
                            //   fontSize: 20,
                            //   fontWeight: FontWeight.w900,
                            // ),
                            // ),
                            // ),
                            Container(
                              child: Row(
                                children: [
                                  SizedBox(height: 20,),
                                  SizedBox(width: 20,),
                                  //SizedBox(width: 140,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      //SizedBox(width: 20,),
                                      Text('Saldo anda: ',
                                        style: TextStyle(fontSize: 20,
                                            color: Colors.black),),
                                      Text('Rp.200.000 ',
                                        style: TextStyle(fontSize: 25,
                                            color: Colors.green),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 50,),


                            // TextButton(
                            //   onPressed: () {
                            //     authController.signOut();
                            //     Get.to(LoginPage());
                            //   },
                            //   child: Text("Log Out", style: TextStyle(
                            //     color: Colors.red,
                            //     fontSize: 18,
                            //     fontWeight: FontWeight.w900,
                            //   ),
                            //   ),
                            // ),


                            // ElevatedButton(
                            //   onPressed: () {
                            //     Get.to(AuthView());
                            //   },
                            //   child: SvgPicture.asset(
                            //     'assets/pict1/Logout.svg', height: 16,),
                            // ),


                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 330,),
                  TextButton(
                    onPressed: () {
                      // authController.signOut();
                      Get.offAll(LoginPage());
                    },
                    child: Text("Log Out", style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                    ),
                  ),

                  // MaterialButton(
                  //   onPressed: () {
                  //     authController.signOut();
                  //     Get.to(LoginPage());
                  //     //Get.to(HomePage());
                  //     // item: item));
                  //   },
                  //   child: Text('Log Out'
                  //     'assets/pict/bx_bx-home-alt.svg',),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
//
//   Widget displayUserInformation(context, snapshot) {
//     final user = snapshot.data;
//
//     return Column(
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             "Name: ${user.displayName ?? 'Anonymous'}", style: TextStyle(fontSize: 20),),
//         ),
//
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text("Email: ${user.email ?? 'Anonymous'}", style: TextStyle(fontSize: 20),),
//         ),
//
//         // Padding(
//         //   padding: const EdgeInsets.all(8.0),
//         //   child: Text("Created: ${DateFormat('MM/dd/yyyy').format(
//         //       user.metadata.creationTime)}", style: TextStyle(fontSize: 20),),
//         // ),
//
//         showSignOut(context, user.isAnonymous),
//       ],
//     );
//   }
// }
//       Widget showSignOut(context, bool isAnonymous) {
//         if (isAnonymous == true) {
//           return MaterialButton(
//             child: Text("Sign In To Save Your Data"),
//             onPressed: () {
//               Navigator.of(context).pushNamed('/convertUser');
//             },
//           );
//         } else {
//           return MaterialButton(
//             child: Text("Sign Out"),
//             onPressed: () async {
//               try {
//                 await Provider.of(context).auth.signOut();
//               } catch (e) {
//                 print(e);
//               }
//             },
//           );
//         }
//       }

// class Provider extends InheritedWidget {
//   final AuthController auth;
//
//   Provider({Key? key, required Widget child, required this.auth}) : super(key: key, child: child);
//
//   @override
//   bool updateShouldNotify(InheritedWidget oldWidget) {
//     return true;
//   }
//
//   static Provider of(BuildContext context) =>
//       (context.inheritFromWidgetOfExactType(Provider) as Provider);
// }
}

class ProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(
          () => HomePageController(),
    );
  }
}

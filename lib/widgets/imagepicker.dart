// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:foodcourtapp/services/AuthProvider.dart';
// import 'package:provider/provider.dart';
//
// class ShopPicCard extends StatefulWidget {
//   @override
//   State<ShopPicCard> createState() => _ShopPicCardState();
// }
//
// class _ShopPicCardState extends State<ShopPicCard> {
//   late File _image;
//
//   @override
//   Widget build(BuildContext context) {
//     final _authData = Provider.of<AuthProvider>(context);
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//      child: InkWell(
//        // onTap: () {
//        //   _authData.getImage().then((image){
//        //     setState(() {
//        //       _image=image;
//        //     });
//        //     if(image!=null){
//        //       _authData.isPicAvail=true;
//        //     }
//        //   });
//        // },
//        child: Card(
//          child: _image == null ? Center(
//            child: Text(
//              'Add Shop Image',
//              style: TextStyle(color: Colors.grey),
//            )):Image.file(_image, fit: BoxFit.fill,),
//            ),
//          ),
//        );
//   }
// }

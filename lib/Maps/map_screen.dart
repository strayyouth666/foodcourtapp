// // import 'dart:html';
//
// import 'package:flutter/material.dart';
// import 'package:foodcourtapp/services/location_provider.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:location/location.dart';
// // import 'package:google_maps_webservice/directions.dart';
// import 'package:provider/provider.dart';
//
// class MapScreen extends StatefulWidget {
//   const MapScreen({Key? key}) : super(key: key);
//
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }
//
// class _MapScreenState extends State<MapScreen> {
//   LatLng? currentLocation;
//   GoogleMapController? _mapController;
//   // Location location = Location();
//
//   // Future<LatLng> get() async {
//   //   final _locationData = await location.getLocation();
//   //   return LatLng(_locationData.latitude!, _locationData.longitude!);
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     final locationData = Provider.of<LocationProvider>(context);
//
//     setState(() {
//       // currentLocation = LatLng(-7.2848660882226035, 112.79643152840464);
//       currentLocation = LatLng(locationData.latitude!, locationData.latitude!);
//     });
//
//     void onCreated(GoogleMapController controller){
//       setState(() {
//         _mapController=controller;
//       });
//     }
//
//
//     return Scaffold(
//         body:  SafeArea(
//           child: Stack(
//             children: [
//               GoogleMap(
//                 initialCameraPosition: CameraPosition(target: currentLocation!, zoom: 14.4746,),
//                 zoomControlsEnabled: false,
//                 minMaxZoomPreference: MinMaxZoomPreference(1.5,20.8,),
//                 myLocationEnabled: true,
//                 myLocationButtonEnabled: true,
//                 mapType: MapType.normal,
//                 mapToolbarEnabled: true,
//                 onCameraMove: (CameraPosition position){
//                   locationData.onCameraMove(position);
//                 },
//                 onMapCreated: onCreated,
//                 onCameraIdle: () {
//                   locationData.getMoveCamera();
//                 },
//               ),
//               // IconButton(onPressed: (){}, icon: icon),
//             ],
//           ),
//         ),
//     );
//   }
// }

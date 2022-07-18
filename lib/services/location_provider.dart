import 'package:flutter/cupertino.dart';
// import 'package:geocode/geocode.dart';
// import 'package:geocoder/geocoder.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationProvider with ChangeNotifier{

  double? latitude;
  double? longitude;
  bool permissionAllowed = false;
  var selectedAddress;

   getCurrentPosition()async{
    Position? position =  await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    if(position!=null){
      this.latitude=position.latitude;
      this.longitude=position.longitude;
      this.permissionAllowed = true;
      notifyListeners();
    }else{
      print('Permission not allowed');
    }

  }
  void onCameraMove(CameraPosition cameraPosition)async{
    this.latitude=cameraPosition.target.latitude;
    this.longitude=cameraPosition.target.longitude;
    notifyListeners();
  }

  getMoveCamera()async{
    GeoData data = await Geocoder2.getDataFromCoordinates(
        latitude: 40.714224,
        longitude: -73.961452,
        googleMapApiKey: "AIzaSyBhHHqXdSjKpUnpLPQHuAXmVqKeH0u_FHM");

    //Formated Address
    print(data.address);
    //City Name
    print(data.city);
    //Country Name
    print(data.country);
    //Country Code
    print(data.countryCode);
    //Latitude
    print(data.latitude);
    //Longitude
    print(data.longitude);
    //Postal Code
    print(data.postalCode);
    //State
    print(data.state);
    //Street Number
    print(data.street_number);

    print("${selectedAddress.featurename} : ${selectedAddress.addressesLine}");
  }
}


import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

late  double latitude;
late  double longitude;
class Location{


  late LocationPermission permission;
  Future<void> getCurrentLocation() async {
    try{
      permission = await Geolocator.requestPermission();

        Position currentPosition = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        latitude = currentPosition.latitude;
        longitude = currentPosition.longitude;

    }
    catch(e){
      throw e;
    }
  }



}
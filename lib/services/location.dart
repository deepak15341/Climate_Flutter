import 'dart:io';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

late  double latitude;
late  double longitude;
class Location{


  Future<void> getCurrentLocation()  async {
    try{
        Position currentPosition = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        latitude = currentPosition.latitude;
        longitude = currentPosition.longitude;
    }
    catch(e){
      rethrow;
    }
  }
}
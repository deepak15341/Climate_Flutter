import 'package:geolocator/geolocator.dart';

class Location{
  late double latitude;
  late double longitude;
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
      print(e);
    }
  }
}
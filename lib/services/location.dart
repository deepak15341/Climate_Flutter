import 'package:geolocator/geolocator.dart';

import 'networking.dart';
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
      print(e);
    }
  }
  Future<void> getLocation() async {
    await getCurrentLocation();
    await Networking().getData();
  }

  String getURI(){
    return 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=0780487e2c6fe7168b086bd8be9d2435#';
}
double getlatitude(){
    return latitude;
}
  double getlongitude(){
    return longitude;
  }

}
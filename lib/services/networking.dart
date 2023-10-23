import 'dart:convert';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;

class Networking{

  Location location = Location();
  String uri = 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=0780487e2c6fe7168b086bd8be9d2435#';
  Future<void> getData()async {

    http.Response response = await http.get(Uri.parse(uri));
    if(response.statusCode==200){
      var decodeData = response.body;
      var condition = jsonDecode(decodeData)['weather'][0]['main'];
      var temperature = jsonDecode(decodeData)['main']['temp'];
      var cityName = jsonDecode(decodeData)['name'];

      print("$condition , $temperature , $cityName");
    }else{
      print(response.statusCode);
    }
  }
}

import 'dart:convert';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:clima/screens/loading_screen.dart';


class Networking{
  LoadingScreenState loadingScreen = LoadingScreenState();
  Location location = Location();

  Future<String> getData(String type)async {
    late http.Response response;
    if(type=='latlong') {
      response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=0780487e2c6fe7168b086bd8be9d2435#'));
    }
    else  {
      response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$type&appid=0780487e2c6fe7168b086bd8be9d2435#'));
    }
    if(response.statusCode==200){
      var decodeData = response.body;
      var condition = jsonDecode(decodeData)['weather'][0]['id'];
      var temperature = jsonDecode(decodeData)['main']['temp'];
      var cityName = jsonDecode(decodeData)['name'];
      String  data = "$condition , $temperature , $cityName";
      return data;
    }else{
      throw response.statusCode;
    }
  }


}

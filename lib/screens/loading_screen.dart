
import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    Location().getLocation();
  }




  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: ()  {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CityScreen(),));
          },
          child: const Text("Get Location"),
        ),
      ),
    );
  }

}




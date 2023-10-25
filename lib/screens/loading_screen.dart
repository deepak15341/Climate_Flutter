import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import '../services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  Location location = Location();

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    //LocationPermission permission = await Geolocator.requestPermission();
    if ( LocationPermission.denied==false) {
      Fluttertoast.showToast(
          msg: 'please provide Location Access',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.grey);
      // If permission is denied, close the app
      SystemNavigator.pop();
    } else {
      await location.getCurrentLocation();
      String dataFromNetwork = await Networking().getData('latlong');
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LocationScreen(dataFromNetwork),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    //mcontext = context;
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitSpinningLines(
              color: Colors.white,
              size: 50.0,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Loading...",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

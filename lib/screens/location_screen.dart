
import 'package:clima/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/location.dart';

import '../services/networking.dart';

class LocationScreen extends StatefulWidget {
  String dataFromNetwork;

  LocationScreen(this.dataFromNetwork, {super.key});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  late String dataFromNetwork;
  late List<String> splitted;
  late String condition,temperture,address;
  @override
  void initState() {
    super.initState();
    dataFromNetwork = widget.dataFromNetwork;
    splitted = dataFromNetwork.split(',');
    condition = splitted[0];
    temperture = (double.parse(splitted[1])-273).toStringAsFixed(0);
    address = splitted[2];

  }

  @override
  Widget build(BuildContext context) {
/*    print('$condition $temperture $address');*/
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () async {
                     await Location().getCurrentLocation();
                     String freshDatafromNetwork = await Networking().getData();
                     /*print(freshDatafromNetwork);*/
                     setState(() {
                       dataFromNetwork = freshDatafromNetwork;
                       splitted = dataFromNetwork.split(',');
                       condition = splitted[0];
                       temperture = (double.parse(splitted[1])-273).toStringAsFixed(0);
                       address = splitted[2];
                     });

                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
               Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperture°',
                      style: kTempTextStyle,
                    ),
                    const Text(
                      '☀️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
               Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "It's 🍦 time in $address",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

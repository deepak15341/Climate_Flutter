import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
const kInputFieldDecoration = InputDecoration(icon: Icon(Icons.location_city,size: 35),iconColor: Colors.grey,
filled: true,
hintText: 'please enter city',
fillColor: Colors.white,
hintStyle: TextStyle(color: Colors.grey),
border: OutlineInputBorder(
borderRadius: BorderRadius.all(Radius.circular(10))));

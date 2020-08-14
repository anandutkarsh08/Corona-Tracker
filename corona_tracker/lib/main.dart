import 'package:corona_tracker/data.dart';
import 'package:corona_tracker/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Ubuntu',
      primaryColor: grey,
    ),
    home: HomePage(),
  ));
} 

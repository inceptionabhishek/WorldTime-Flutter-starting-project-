import 'package:flutter/material.dart';
import 'package:world_time_app/screen/choose_location.dart';
import 'package:world_time_app/screen/home.dart';
import 'package:world_time_app/screen/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/' : (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}

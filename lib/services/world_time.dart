import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {
  String location;
  String time="";
  String flag;
  String url;
  bool isDayTime=false;

  WorldTime({required this.location,required this.flag,required this.url});
  Future<void> fetchdata() async {
    try{
      final response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data= json.decode(response.body);
      String dateTime = data['datetime'];
      String offset= data['utc_offset'].substring(1,3);
      DateTime now = DateTime.parse(dateTime);
      print(now);
      now=now.add(Duration(hours: int.parse(offset)));
      print(now.hour);

      if(now.hour>6 && now.hour<20){
        isDayTime=true;
      }
      else{
        isDayTime=false;
      }


      time= DateFormat.jm().format(now);
    }
    catch(e){
      print(e);
      time="Could not get data";
    }

  }
}
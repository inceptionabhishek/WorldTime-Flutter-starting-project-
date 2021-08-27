import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:world_time_app/services/world_time.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_spinkit/flutter_spinkit.dart' ;

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time="loading";
  void setUpWorldTime() async{
    WorldTime instance =WorldTime(location: 'Kolkata', flag: 'India.png', url: 'Asia/Kolkata');
    await instance.fetchdata();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : instance.location,
      'flag': instance.flag,
      'time' : instance.time,
      'isDayTime' : instance.isDayTime,
    });
  }
  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: Padding(

        padding: EdgeInsets.all(50.0),
        child: Center(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              SpinKitFadingCircle(
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven ? Colors.white : Colors.green,
                    ),
                  );
                },
              ),
              Text(
                'Loading...',
                style: (
                TextStyle(
                  fontSize: 20.0,

                )
                ),
              ),

            ],

          ),

        )
      ),
    );
  }
}

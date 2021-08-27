import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data ={};
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    String bgimage;
    print(data['isDayTime']);
    if(data['isDayTime']==null){
      bgimage='night.jpg';
    }
    else{
      bgimage=data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    }
    return SafeArea(
      child: Scaffold(
        body: SafeArea(

          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgimage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
              child: Column(
                children: <Widget> [
                  FlatButton.icon(
                      onPressed:  () async {
                        dynamic result= await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time' : result['time'],
                            'location' : result['location'],
                            'flag' : result['flag'],
                          };
                        });
                      },
                      icon: Icon(Icons.edit_location,),
                      label: Text('Edit Location', style: TextStyle(
                        color:Colors.white,
                      ),),

                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 20.0,
                          letterSpacing: 2.0,
                          color:Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 50.0,
                      letterSpacing: 3.0,
                      color:Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

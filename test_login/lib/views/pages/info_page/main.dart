import 'package:flutter/material.dart';
import '../gps/homepage.dart';
import '../home_page.dart';
import 'LayoutStarts.dart';


class InfoPage extends StatelessWidget {

  final String name,imagePath,information;
  final double lat,long;

  InfoPage({Key key,this.name,this.imagePath,this.information,this.lat,this.long}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainApp(name:this.name,imagePath:this.imagePath,information:this.information,lat: this.lat,long: this.long),
    );
  }
}

class MainApp extends StatelessWidget {
  final String name,imagePath,information;
  final double lat,long;
  MainApp({Key key,this.name,this.imagePath,this.information,this.lat,this.long}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Container(
            margin: EdgeInsets.only(left: 25),
            child: IconButton(
                icon:new Icon(Icons.arrow_back,
              color: Colors.white,

                       ),
                onPressed: () {
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  var route=new MaterialPageRoute(
                    builder: (BuildContext context)=>
                    new HomePage(),
                  );
                  Navigator.of(context).push(route);
                })
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 25),
            child:  IconButton(
                icon:new Icon(Icons.location_on),
              onPressed: () {
                var route=new MaterialPageRoute(
                  builder: (BuildContext context)=>
                  new HomePage1(name: this.name,lat: this.lat,long: this.long,imagePath: this.imagePath,information: this.information),
                );
                Navigator.of(context).push(route);
              }
          ))
        ],
      ),
      backgroundColor: Colors.blueAccent,
      body: LayoutStarts(name:this.name,imagePath:this.imagePath,information:this.information),
    );
  }
}






import 'package:flutter/material.dart';
import 'package:lastapp/views/reservation/Reservation.dart';
import '../gps/homepage.dart';
import '../home_page.dart';
import 'LayoutStarts.dart';
import '../../comment/main.dart';


class InfoPage extends StatelessWidget {

  final String id_restaurant,name,imagePath,information,value;
  final double lat,long;

  InfoPage({Key key,this.id_restaurant,this.name,this.imagePath,this.information,this.lat,this.long,this.value}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainApp(id_restaurant:this.id_restaurant,name:this.name,imagePath:this.imagePath,information:this.information,lat: this.lat,long: this.long,value:this.value),
    );
  }
}

class MainApp extends StatelessWidget {
  final String id_restaurant,name,imagePath,information,value;
  final double lat,long;
  MainApp({Key key,this.id_restaurant,this.name,this.imagePath,this.information,this.lat,this.long,this.value}) : super(key:key);
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
              )

          ),
           Container(
              margin: EdgeInsets.only(right: 10),
              child:  IconButton(
                  icon:new Icon(Icons.add_comment),
                  onPressed: () {
                    var route=new MaterialPageRoute(
                      builder: (BuildContext context)=>
                      new maincomment(id_restaurant:this.id_restaurant,name:this.name,imagePath:this.imagePath,information:this.information,value:this.value,lat: this.lat,long: this.long),
                    );
                    Navigator.of(context).push(route);
                  }
              )

          ),

          Container(
              margin: EdgeInsets.only(right: 15),
              child:  IconButton(
                  icon:new Icon(Icons.restaurant),
                  onPressed: () {
                    var route=new MaterialPageRoute(
                      builder: (BuildContext context)=>
                      new Reservation(value: value,id_restaurant: id_restaurant,name : name),
                    );

                    Navigator.of(context).push(route);
                  }
              )


          )
        ],

      ),
      backgroundColor: Colors.blueAccent,
      body: LayoutStarts(id_restaurant:this.id_restaurant,name:this.name,imagePath:this.imagePath,information:this.information,value:this.value),
    );
  }
}






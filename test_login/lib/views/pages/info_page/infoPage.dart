import 'package:flutter/material.dart';



class InfoPage1 extends StatefulWidget{
  final String name,imagePath,information;
  InfoPage1({Key key,this.name,this.imagePath,this.information}) : super(key:key);
  @override
  _InfoPage1State createState() => _InfoPage1State();
}

class _InfoPage1State extends State<InfoPage1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),


      child:   new Image.asset(
        widget.imagePath,
        fit: BoxFit.cover,
        width: 150.0,
        height: 250.0,
      ),



    );
  }
}


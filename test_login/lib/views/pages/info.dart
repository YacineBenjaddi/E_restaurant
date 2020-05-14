import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
 final String name,imagePath,information;
 InfoPage({Key key,this.name,this.imagePath,this.information}) : super(key:key);
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("${widget.name}"),
      ),
      body: new Container(
          alignment: Alignment.topCenter,
    child: new ListView(
      padding: const EdgeInsets.all(2.0),
          children: <Widget>[

                  new Image.asset(
                    widget.imagePath,
                    fit: BoxFit.cover,
                    width: 450.0,
                    height: 300.0,
            ),
    new Container(
    margin: const EdgeInsets.all(3.0),
    height: 345.0,
    width: 290.0,

    child: new Column(
    children: <Widget>[
    new Text(
      "${widget.information}",
      style: new TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
          fontSize: 19.9),
    ),
    ]
    ),
    )

          ],
    )
    )
    );

  }
}

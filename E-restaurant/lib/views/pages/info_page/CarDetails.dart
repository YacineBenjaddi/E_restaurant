import 'package:flutter/material.dart';
import 'infoPage.dart';


class CarDetails extends StatelessWidget {
  final String id_restaurant,name,imagePath,information,value;
  CarDetails({Key key,this.id_restaurant,this.name,this.imagePath,this.information,this.value}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 30),
              child: _carTitle(),
            ),
            Container(
              width: double.infinity,
              child: InfoPage1(name:this.name,imagePath:this.imagePath,information:this.information),
            )
          ],
        ));
  }

  _carTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RichText(
          text: TextSpan(
              style: TextStyle(color: Colors.white, fontSize: 20),
              children: [
                //TextSpan(text: "Restaurant"),
                // TextSpan(text: "\n"),
                TextSpan(
                    text: this.name,
                    style: TextStyle(fontWeight: FontWeight.w100, fontSize: 25.0)),
              ]),
        ),
      ],
    );
  }
}
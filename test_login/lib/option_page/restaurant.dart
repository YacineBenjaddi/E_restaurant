import 'package:flutter/material.dart';
import 'cinema.dart';
import 'background.dart';
import 'component.dart';
import 'names.dart';
import '../home/app.dart';

class Restaurant extends StatelessWidget {
  final Quote quoteObj = quotes[0];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new ApplyBackground(quoteObj.imageURL),
          new ComponentRow(quoteObj.quote, quoteObj.personName, route: new Cinema(),),
          SizedBox(height: 10.0),
          Center(
            child: Padding(
              padding: const EdgeInsets.only( top: 150),
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.grey,
                child: Text('Go to main page'),
                onPressed: () {
                  // TODO
                  Navigator.push(context, MaterialPageRoute(builder: (context) => App()));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

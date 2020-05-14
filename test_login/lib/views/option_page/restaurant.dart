import 'package:flutter/material.dart';
import 'cinema.dart';
import 'background.dart';
import 'component.dart';
import 'names.dart';
import '../../views/app.dart';

class Restaurant extends StatelessWidget {
  final String value;
  Restaurant({Key key,this.value});
  final Quote quoteObj = quotes[0];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new ApplyBackground(quoteObj.imageURL),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new ComponentRow(quoteObj.quote, quoteObj.personName, route: new Cinema(),),

          ),
          SizedBox(height: 10.0),
          Center(
            child: Padding(
              padding: const EdgeInsets.only( top: 150),
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.grey,
                child: Text('Go to main page'),
                onPressed: () {
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) => new App(value: value),
                  );
                  Navigator.of(context).push(route);
                  // TODO

                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

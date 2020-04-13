import 'package:flutter/material.dart';
import 'package:gal/cinema.dart';
import 'background.dart';
import 'component.dart';
import 'names.dart';

class Restaurant extends StatelessWidget {
  final Quote quoteObj = quotes[0];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new ApplyBackground(quoteObj.imageURL),
          new ComponentRow(quoteObj.quote, quoteObj.personName, route: new Cinema(),)
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gal/library.dart';
import 'background.dart';
import 'component.dart';
import 'names.dart';

class Cinema extends StatelessWidget {
  final Quote quoteObj = quotes[1];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new ApplyBackground(quoteObj.imageURL),
          new ComponentRow(quoteObj.quote, quoteObj.personName, route: new Library(),)
        ],
      ),
    );
  }
}
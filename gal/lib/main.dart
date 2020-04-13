import 'package:flutter/material.dart';
import 'package:gal/library.dart';
import 'package:gal/restaurant.dart';
import 'package:gal/cinema.dart';
void main() => runApp(new QuoteApp());

class QuoteApp extends StatelessWidget {
  List<Widget> pages = [Restaurant(), Cinema(), Library()];
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Gallery',
      home: PageView.builder(
        itemCount: pages.length,
        itemBuilder: (BuildContext context, int index) => pages[index],
      ),
    );
  }
}

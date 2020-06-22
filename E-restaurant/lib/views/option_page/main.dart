import 'package:flutter/material.dart';
import 'library.dart';
import 'restaurant.dart';
import 'cinema.dart';

class option extends StatefulWidget {


final String title = 'E-RESTAURANT';

@override
QuoteApp createState() => QuoteApp();
}
class QuoteApp extends State<option>{
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

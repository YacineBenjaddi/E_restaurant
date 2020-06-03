import 'package:flutter/material.dart';
import 'CarDetailsAnimation.dart';
import 'CustomBottomSheet.dart';

class LayoutStarts extends StatelessWidget {
  final String name,imagePath,information;
  LayoutStarts({Key key,this.name,this.imagePath,this.information}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CarDetailsAnimation(name:this.name,imagePath:this.imagePath,information:this.information),
        CustomBottomSheet(name:this.name,imagePath:this.imagePath,information:this.information),
      ],
    );
  }
}
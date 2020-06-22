import 'package:flutter/material.dart';
import 'CarDetailsAnimation.dart';
import 'CustomBottomSheet.dart';

class LayoutStarts extends StatelessWidget {
  final String id_restaurant,name,imagePath,information,value;
  LayoutStarts({Key key,this.id_restaurant,this.name,this.imagePath,this.information,this.value}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CarDetailsAnimation(id_restaurant:this.id_restaurant,name:this.name,imagePath:this.imagePath,information:this.information,value:this.value),
        CustomBottomSheet(id_restaurant:this.id_restaurant,name:this.name,imagePath:this.imagePath,information:this.information,value:this.value),
      ],
    );
  }
}
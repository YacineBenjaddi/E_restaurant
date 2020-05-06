import 'package:flutter/material.dart';

class restaurant{

  //final int id_restaurant;
  final String id;
  final String name;

  final String imagePath;
  final String category;
  final double discount;
  final double ratings;
  final String information;

  restaurant({this.id, this.name, this.imagePath, this.category, this.discount,
      this.ratings,this.information});
}
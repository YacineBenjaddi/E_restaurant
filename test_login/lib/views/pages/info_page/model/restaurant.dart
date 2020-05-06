import 'package:flutter/material.dart';

double iconSize = 30;


RestaurantList restaurantList = RestaurantList(restaurants: [
  Restaurant(type: "Restaurant", RestaurantName: "", imgList: [


  ],),

]);

class RestaurantList {
  List<Restaurant> restaurants;

  RestaurantList({
    this.restaurants,
  });
}

class Restaurant {
  String type;
  String RestaurantName;
  List<String> imgList;


  Restaurant({
  this.type,this.RestaurantName,this.imgList,

  });
}
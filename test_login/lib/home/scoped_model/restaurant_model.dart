import 'dart:convert';

import '../models/restau_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
class Restaurant_model extends Model {
  List<restaurant> _restaurants = [];

  List<restaurant> get restaurants{
    return List.from(_restaurants);
  }
   void addRestaurant(restaurant rest){
     _restaurants.add(rest);
   }
   
   void fetchRestau(){
     http.get("http://192.168.100.5/Test/api/restaurants/getRestau.php").then((http.Response response){
   //  print("fetchiiiiiiiiiiing :${response.body}");
    final List fetchedData=json.decode(response.body);
    //print(fetchedData);
    final List<restaurant> fetchedRestau=[];
    fetchedData.forEach((rest){
    //print(rest);
      restaurant restaurants = restaurant(
        id: rest["id_restaurant"],
        name: rest["name"],
        imagePath: rest["imagepath"],
        category: rest["category"],
        discount: double.parse(rest["discount"]),
        ratings: double.parse(rest["ratings"]),
      );
      fetchedRestau.add(restaurants);
        });
    _restaurants=fetchedRestau;
    //print(_restaurants[0].imagePath);
    });

  }
}
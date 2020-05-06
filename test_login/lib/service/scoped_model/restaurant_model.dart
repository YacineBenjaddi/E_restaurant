import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

import '../../models/home_models/restau_model.dart';

class Restaurant_model extends Model {
  List<restaurant> _restaurants = [];

  List<restaurant> get restaurants {
    return List.from(_restaurants);
  }

  void addRestaurant(restaurant rest) {
    _restaurants.add(rest);
  }

  void fetchRestau() {
    http
        .get("http://192.168.100.13/Test/api/restaurants/getRestau.php")
        .then((http.Response response) {
      final List fetchedData = json.decode(response.body);

      final List<restaurant> fetchedRestau = [];
      fetchedData.forEach((rest) {
        restaurant restaurants = restaurant(
          id: rest["id_restaurant"],
          name: rest["name"],
          imagePath: rest["imagepath"],
          category: rest["category"],
          discount: double.parse(rest["discount"]),
          ratings: double.parse(rest["ratings"]),
          information: rest["info"],
        );
        print("${restaurants.information}");
        fetchedRestau.add(restaurants);
      });
      _restaurants = fetchedRestau;
    });
  }
}

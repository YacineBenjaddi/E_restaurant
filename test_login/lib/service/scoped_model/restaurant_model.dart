import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'package:lastapp/service/ApiUrl.dart';
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
        .get(ApiUrl.getAllRestaurant)
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
            lat: double.parse(rest["latitude"]),
            long: double.parse(rest["longitude"]),
            information: rest["info"]


        );
        print("id estttttttttttt    ${restaurants.id}");
        print("name esttttttttttt  ${restaurants.name}");
        print("image estttttttttttt    ${restaurants.imagePath}");
        print("categor esttttttttttt  ${restaurants.category}");
        print("discount estttttttttttt    ${restaurants.discount}");
        print("rating esttttttttttt  ${restaurants.ratings}");
        print("info estttttttttttt    ${restaurants.information}");
        print("latidtude esttttttttttt  ${restaurants.lat}");
        print("longitude estttttttttttt    ${restaurants.long}");

        fetchedRestau.add(restaurants);

      });

      _restaurants = fetchedRestau;
    });
  }
}

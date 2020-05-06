import 'package:flutter/material.dart';
import 'package:lastapp/models/home_models//category_model.dart';
import '../../models/data/category_data.dart';
import '../../models/home_models/category_model.dart';
import 'restaurant_card.dart';

class RestaurantCategory extends StatelessWidget {
  final _categories = categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _categories.length,
          itemBuilder: (BuildContext Context, int index) {
            return RestaurantCard(
              categoryName: _categories[index].categoryName,
              imagePath: _categories[index].imagePath,
              numberOfItems: _categories[index].numbersOfItems,
            );
          }),
    );
  }
}

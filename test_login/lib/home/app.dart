import 'package:flutter/material.dart';
import 'scoped_model/restaurant_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'screens/main_screen.dart';
class App extends StatelessWidget {
 final Restaurant_model restaurantmodel=Restaurant_model();
  @override
  Widget build(BuildContext context) {
    return ScopedModel<Restaurant_model>(
      model: restaurantmodel,
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Restaurant App",
        theme: ThemeData(primaryColor: Colors.blueAccent),
        home:   MainScreen(restaurantmodel: restaurantmodel),
      ),
    );
  }
}
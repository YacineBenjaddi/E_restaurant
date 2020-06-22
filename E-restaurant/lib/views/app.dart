import 'package:flutter/material.dart';
import 'package:lastapp/service/scoped_model/main_model.dart';
import '../service/scoped_model/restaurant_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'screens/main_screen.dart';
class App extends StatelessWidget {
  final String value;
  App({Key key,this.value});

  final MainModel mainModel=MainModel();
  @override
  Widget build(BuildContext context) {

    return ScopedModel<MainModel>(
      model: mainModel,
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,

        title: "Restaurant App",
        theme: ThemeData(primaryColor: Colors.blueAccent),
        home:   MainScreen(model: mainModel,value:value),
      ),
    );
  }
}
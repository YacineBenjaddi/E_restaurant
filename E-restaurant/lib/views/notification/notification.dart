import 'package:flutter/material.dart';
import 'package:lastapp/views/notification/widget/notification_widget.dart';



class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) => MaterialApp(

  );
}

class MainPage extends StatelessWidget {



  @override
  Widget build(BuildContext context) => Scaffold(

    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Notification_widget(),
    ),
  );
}
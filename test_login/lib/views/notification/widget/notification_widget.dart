import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lastapp/views/notification/local_natifications/local_notifications_helper.dart';

import '../page/SecondPage.dart';

class Notification_widget extends StatefulWidget{
  @override
  Notification_widgetState createState()=> Notification_widgetState();

}
class Notification_widgetState extends State<Notification_widget> {


  final notifications = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();

    final settingsAndroid = AndroidInitializationSettings('icone_restau');
    final settingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));

    notifications.initialize(
        InitializationSettings(settingsAndroid, settingsIOS),
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async => await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SecondPage(payload: payload)),
  );

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView(
      children: <Widget>[
        title('Basics'),
        RaisedButton(
          child: Text('Show notification'),
          onPressed: () => showOngoingNotification(notifications,
              title: 'Tite', body: 'Body'),
        ),

        RaisedButton(
          child: Text('Replace notification'),
          onPressed: () => showOngoingNotification(notifications,
              title: 'ReplacedTitle', body: 'ReplacedBody'),
        ),
        RaisedButton(
          child: Text('Other notification'),
          onPressed: () => showOngoingNotification(notifications,
              title: 'OtherTitle', body: 'OtherBody', id: 20),
        ),
        const SizedBox(height: 32),
        title('Feautures'),
        RaisedButton(
          child: Text('Silent notification'),
          onPressed: () => showSilentNotification(notifications,
              title: 'SilentTitle', body: 'SilentBody', id: 30),
        ),
        const SizedBox(height: 32),
        title('Cancel'),
        RaisedButton(
          child: Text('Cancel all notification'),
          onPressed: notifications.cancelAll,
        ),
      ],
    ),
  );

  Widget title(String text) => Container(
    margin: EdgeInsets.symmetric(vertical: 4),
    child: Text(
      text,
      style: Theme.of(context).textTheme.title,
      textAlign: TextAlign.center,
    ),
  );
}
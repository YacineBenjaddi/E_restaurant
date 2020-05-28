import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String payload;


  const SecondPage({
    @required this.payload,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      decoration: new BoxDecoration(
          image: new DecorationImage(
              image: AssetImage('assets/images/maph5.jpg'),
              fit: BoxFit.fill)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Your verification code is :  ',
              style: Theme.of(context).textTheme.title,
            ),
            const SizedBox(height: 8),
            Text(
              payload,
              style: Theme.of(context).textTheme.subtitle,
            ),
            const SizedBox(height: 8),
            RaisedButton(
              child: Text('Back'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    ),
  );
}
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:lastapp/service/ApiUrl.dart';
import 'package:lastapp/views/notification/local_natifications/local_notifications_helper.dart';
import 'package:lastapp/views/notification/page/SecondPage.dart';

import '../../models/User.dart';
import '../main.dart';

class ValidatePassword extends StatefulWidget {
  final String email;


  ValidatePassword(this.email);

  @override
  ValidatePasswordState createState() => ValidatePasswordState();
}

class ValidatePasswordState extends State<ValidatePassword> {
  //============ notification ====================

  final notifications = FlutterLocalNotificationsPlugin();

  //============ end notification ==================

  void initState() {
    super.initState();
    _getOne();
    //get_code();
    getCode();

    //=============== notification ===============

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

  //============== end notification =============

  String code;

  String password;
  var key = GlobalKey<FormState>();

  cek() {
    final form = key.currentState;
    if (form.validate()) {
      form.save();
      submit();
    }
  }

  Future<List<User>> getCode() async {
    var msg = "";
    final response = await http.post(ApiUrl.getOne, body: {
      "email": widget.email,
    });
    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        msg = "Login Fail";
      });
    }

    if (datauser.length > 0) {
      setState(() {
        print(datauser);

        code = datauser[0]['reset'];
      });
    }
    return datauser;
  }

  submit() async {
    /*setState(() {
      loading = true;
    });*/
    final response = await http
        .post(ApiUrl.validate, body: {"email": widget.email, "code": code});

    var data = json.decode(response.body);
    int value = data['value'];
    String message = data['message'];
    if (value == 1) {
      print("Valide");
      _getOne();
      PopUp_code_valid();
    } else {
      PopUp_code_Fail();
    }
  }

  int PopUp_code_Fail() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(" ERROR",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat')),
            content: Text(
                "Your password code is incorrect!" + " check it again please",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat')),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  int PopUp_code_valid() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(" Your password is",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat')),
            content: Text(" $password",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat')),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  //Navigator.of(context).pop();
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) => new MyApp(),
                  );
                  Navigator.of(context).push(route);
                },
              )
            ],
          );
        });
  }

  Future<List<User>> _getOne() async {
    var msg = "";
    final response = await http.post(ApiUrl.getOne, body: {
      "email": widget.email,
    });
    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        msg = "Login Fail";
      });
    }

    if (datauser.length > 0) {
      setState(() {
        password = datauser[0]['password'];
      });
    }
    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
                image: AssetImage('assets/images/maph6.jpg'),
                fit: BoxFit.fill)),
        padding: EdgeInsets.all(16.0),
        child: Container(
          // scrollDirection: Axis.vertical,
          // physics: ClampingScrollPhysics(),

          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Enter your password code here!",
                  style: TextStyle(
                    // color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  onSaved: (e) => code = e,
                  validator: (e) {
                    if (e.isEmpty) {
                      return "Enter your password code please!";
                    }
                  },
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    fontFamily: 'Montserrat',
                  ),
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            // Colors.black12,
                            //Colors.black38,
                            //Colors.black12,
                            Colors.green,
                            Colors.green[900],
                          ])),
                  child: FlatButton(
                    onPressed: () {
                      cek();
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 0.0, left: 80.0, right: 20.0),
                  child: FlatButton(
                      onPressed: () {
                        showSilentNotification(notifications,
                            title: 'Verfification code', body: '$code');
                      },
                      child: Text(
                        "Verification code",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          fontFamily: 'Roboto-Regular',
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

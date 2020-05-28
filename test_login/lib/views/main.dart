import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lastapp/service/ApiUrl.dart';
import 'package:lastapp/views/notification/notification.dart';
import 'package:lastapp/views/password/forgot.dart';
import 'package:lastapp/views/signin_google/signinGoogle.dart';
import 'option_page/main.dart';
import 'option_page/restaurant.dart';
import 'signup.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage(),
        '/option': (BuildContext context) => new option(),
        '/forgot' : (BuildContext context) => new ForgotPassword(),
        '/ signin' : (BuildContext context) => new signin(),
        '/ notification' : (BuildContext context) => new MainPage(),

      },
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();


  //==========================Facebook login======================

  //========================== end facebook login =====================
  String msg = '';

  Future<List> _login() async {
    print("user $user password $pass");
    final response =
        await http.post(ApiUrl.login, body: {
      "email": user.text,
      "password": pass.text,
    });
    var idUser;
    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        msg = "Login Fail";
        PopUp_Login_Fail();
      });
    }
    if (datauser[0]['profile'] == 'User') {
      var route = new MaterialPageRoute(
        builder: (BuildContext context) => new Restaurant(value: user.text),
      );
      Navigator.of(context).push(route);

    }

    return datauser;
  }
  int PopUp_Login_Fail() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(" ERROR",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat')),
            content: Text("your email or password is incorrect",
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
  String Email,Pass;
  var key = new GlobalKey<FormState>();
  cek(){
    final form = key.currentState;
    print(form);
    if(form.validate()){
      form.save();
      _login();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: AssetImage('assets/images/map.jpg'),
                      fit: BoxFit.fill)),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              child: Form(
                key: key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(20.0, 110.0, 0.0, 0.0),
                            child: Text('every location',
                                style: TextStyle(
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green)),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20.0, 175.0, 0.0, 0.0),
                            child: Text('has its sweet spot',
                                style: TextStyle(
                                    fontSize: 50.0, color: Colors.green)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        padding:
                            EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              onSaved: (e) => Email = e,
                              validator : (e) {
                                if (e.isEmpty) {
                                  return "Enter your email please!"
                                  ;
                                }
                              },
                              style: TextStyle(

                                //fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                fontFamily: 'Montserrat',

                              ),

                              controller: user,
                              decoration: InputDecoration(
                                  labelText: 'EMAIL',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green))),
                              //obscureText: true,
                            ),
                            SizedBox(height: 40.0),
                            TextFormField(
                              controller: pass,
                              onSaved: (p) => Pass = p,
                              validator : (p) {
                                if (p.isEmpty) {
                                  return "Enter your password please!"
                                  ;
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: 'PASSWORD',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green))),
                              obscureText: true,
                            ),
                            SizedBox(height: 40.0),
                            InkWell(
                              onTap: () {
                                cek();
                                //_login();

                              },
                              child: Container(
                                height: 40.0,
                                color: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black,
                                          style: BorderStyle.solid,
                                          width: 1.0),
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(20.0)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(width: 10.0),
                                      Center(
                                        child: Text('Login',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat')),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 40.0),
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed('/signup');
                                },
                                child: Container(
                                  height: 40.0,
                                  color: Colors.transparent,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black,
                                            style: BorderStyle.solid,
                                            width: 1.0),
                                        color: Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(width: 10.0),
                                        Center(
                                          child: Text('Register',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Montserrat')),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                        SizedBox(height: 10.0),
                        SizedBox(
                          height: 16,
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/forgot');
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              fontFamily: 'Roboto-Regular',

                            ),
                          )
                        )

                          ],

                        )),
                   // SizedBox(height: 10.0),

                    Container(

                    padding: EdgeInsets.only(top: 0.0, left: 80.0, right: 20.0),
                      child: FlatButton(
                          onPressed: () {
                             Navigator.of(context).pushNamed('/ notification');
                            //_loginfb();
                          },
                          child: Text(
                            "Singin with Google",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              fontFamily: 'Roboto-Regular',

                            ),
                          )
                      ),

                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

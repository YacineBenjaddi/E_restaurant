import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Services.dart';
import 'signup.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage()
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

  TextEditingController user=new TextEditingController();
  TextEditingController pass=new TextEditingController();

  String msg='';

  Future<List> _login() async {
    print("user $user password $pass");
    final response = await http.post("http://192.168.43.142/Test/login.php", body: {
      "email": user.text,
      "password": pass.text,
    });

    var datauser = json.decode(response.body);

    if(datauser.length==0){
      setState(() {
        msg="Login Fail";
      });
    }
      if(datauser[0]['profil']=='User'){
        Navigator.pushReplacementNamed(context, '/signup');
    }

    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(image: new DecorationImage(image: AssetImage('assets/images/map.jpg'), fit: BoxFit.fill)
              ),
            ),
    Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 110.0, 0.0, 0.0),
                    child: Text('every location',
                        style: TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.bold, color: Colors.green)),
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
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: user,
                      decoration: InputDecoration(
                          labelText: 'EMAIL',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                     // obscureText: true,
                    ),
                    SizedBox(height: 40.0),
                    TextField(
                      controller: pass,
                      decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      obscureText: true,
                    ),
                    SizedBox(height: 40.0),
                InkWell(
                  onTap: () {
                    _login();
             /* if(Services.login(user.text,pass.text) == "User") {
                    Navigator.of(context).pushNamed('/signup');
                   }*/
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

               child :     Container(
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
                              child: Text('Register',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat')),
                            )
                          ],
                        ),

                      ),

                    )
    ),
                  ],
                )),
          ],
    )
          ],
    ));
  }
}

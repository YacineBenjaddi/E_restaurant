import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:lastapp/service/ApiUrl.dart';



class signin extends StatefulWidget {
  @override
  signinState createState() => signinState();
}

class signinState extends State<signin> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }


  signin(String last_name,String first_name, String email, String password, String profile)async {
    final response = await http.post(ApiUrl.signInGoogle, body: {
      "last_name": last_name,
      "first_name": first_name,
      "email": email,
      "password": password,
      "profile": profile,
    });
  }


    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Material(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10.0),
                  child: MaterialButton(
                    onPressed: _handleSignIn,
                    child: Text(
                      "Google Sign In",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Material(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10.0),
                  child: MaterialButton(
                    //onPressed: ,
                    child: Text(
                      "Sign Out",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lastapp/service/Services.dart';


class ForgotPassword extends StatefulWidget{
  @override
   ForgotPasswordState createState()=> ForgotPasswordState();

  }
  class ForgotPasswordState extends State<ForgotPassword> {

    static const ROOT = 'http://192.168.1.5/Test/submit.php';


  String email;
  var key = new GlobalKey<FormState>();


  cek(){
    final form = key.currentState;
    print(form);
    if(form.validate()){
      form.save();
      submit();
    }
  }

  var loading = false;

  submit()async{
    setState(() {
      loading = true;
    });
    final response = await http.post(ROOT);
    final data = jsonDecode(response.body);
    int value = data['value'];
    if(value == 1){

    }else{
      AlertDialog(
        title: Text("Your email is introvable!"),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(


       body :Container(
         decoration: new BoxDecoration(
             image: new DecorationImage(
                 image: AssetImage('assets/images/map.jpg'),
                 fit: BoxFit.fill)),
        padding: EdgeInsets.all(16.0),

        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text("Enter your email address here!",
              style: TextStyle(
               // color: Colors.white,
                 fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextFormField(
              onSaved: (e) => email = e,
              validator : (e) {
                if (e.isEmpty) {
                  return "Enter your email please!";
                }
              },

            ),

            SizedBox(
              height: 16.0,
            ),
            Container(
              width: 150,
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
                  ]
                )
              ),
              child: FlatButton(
                onPressed: (){
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
              
            )
          ],
        ),
      ),
    );

  }

  }



import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lastapp/models/User.dart';
import 'package:lastapp/service/ApiUrl.dart';
import 'package:lastapp/service/Services.dart';
import 'package:lastapp/views/password/validate.dart';


class ForgotPassword extends StatefulWidget{
  @override
   ForgotPasswordState createState()=> ForgotPasswordState();

  }
  class ForgotPasswordState extends State<ForgotPassword> {




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

    final response = await http.post(ApiUrl.submit,body: {"email": email.trim()});

    print("l'email est = $email");

    var data = json.decode(response.body);
    print("la data est = $data");
    int value = data['value'];
    String message= data['message'];
    if(value == 1){
      Navigator.push(context, MaterialPageRoute(
        builder: (context)=> ValidatePassword(email)));

    }else{
      //print(message);
      PopUp_email_Fail();
    }
  }

    int PopUp_email_Fail() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(" ERROR",
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Montserrat')),
              content: Text("Your email is introvable",
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



    @override
  Widget build(BuildContext context) {
    return Scaffold(


       body :Container(
         decoration: new BoxDecoration(
             image: new DecorationImage(
                 image: AssetImage('assets/images/maph5.jpg'),
                 fit: BoxFit.fill)),
        padding: EdgeInsets.all(16.0),

        child: Form(
          key:key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text("Enter your email address here!",
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
                onSaved: (e) => email = e,
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
                decoration: InputDecoration(

                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.green))),
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
      ),
    );

  }

  }


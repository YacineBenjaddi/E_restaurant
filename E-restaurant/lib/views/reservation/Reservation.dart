import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/models/User.dart';
import 'package:lastapp/models/home_models/restau_model.dart';
import 'package:lastapp/service/ApiUrl.dart';
import 'package:http/http.dart' as http;
import 'package:lastapp/service/Services.dart';
import 'package:lastapp/service/scoped_model/restaurant_model.dart';


class Reservation extends StatefulWidget {
  final String name;
  final String value;
  final String id_restaurant;
  Reservation({this.name,this.value,this.id_restaurant});

  //Reservation() : super();


  @override
  ReservationState createState() => ReservationState();
}

class ReservationState extends State<Reservation> {

  TextEditingController DateController;
  TextEditingController HourController;
  String _titleProgress;
  String name,email;
  var id_user;

  @override
  void initState() {
    super.initState();
    email = widget.value;
    name = widget.name;
    widget.id_restaurant;
    DateController = TextEditingController();
    HourController = TextEditingController();
    _getOne();

  }


  _showProgress(String message) {
    setState(() {
      _titleProgress = message;
    });
  }



  int popup() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(" success",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat')),
            content: Text("your addition has been successfully completed",
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

  _addUReservation() {
    if (DateController.text.isEmpty ||
        HourController.text.isEmpty){
      print('Empty Fields');
      return;
    }
    _showProgress('Adding User...');
    Services.addReservation(
        id_user,
        widget.id_restaurant,
      HourController.text,
        DateController.text

        ).then((result) {
      if ('success' == result) {
        _clearValues();
        popup();
      }else{
        print("Error addition ");
      }
    });
  }

  Future<List<User>> _getOne() async {
    var msg = "";
    print("getOneUser $email");
    final response = await http.post(ApiUrl.getOne, body: {
      "email": email,
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
        id_user = datauser[0]['id_user'];
      });
    }
    return datauser;
  }


  _clearValues() {
    DateController.text=" ";
    HourController.text=" ";
  }

  String Date,Hour;
  var key = new GlobalKey<FormState>();
  cek(){
    final form = key.currentState;
    print(form);
    if(form.validate()){
      form.save();
      _addUReservation();
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
                      image: AssetImage('assets/images/maph6.jpg'),
                      fit: BoxFit.fill)),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(20.0, 110.0, 0.0, 0.0),
                          child: Text('Reservation',
                              style: TextStyle(
                                  fontSize: 35.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green)),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(75.0, 160.0, 0.0, 0.0),
                          child: Text('Reserve now',
                              style: TextStyle(
                                  fontSize: 35.0, color: Colors.green)),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key:key,
                    child: Container(
                        padding:
                        EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              onSaved: (e) => Hour = e,
                              validator : (e) {
                                if (e.isEmpty) {
                                  return "Enter an hour please!"
                                  ;
                                }
                              },

                              controller: HourController,
                              decoration: InputDecoration(
                                  labelText: 'Hour',
                                  hintText: '20:00',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,

                                      color: Colors.white),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.green))),

                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              onSaved: (e) => Date = e,
                              validator : (e) {
                                if (e.isEmpty) {
                                  return "Enter a date please!"
                                  ;
                                }
                              },

                              controller: DateController,
                              decoration: InputDecoration(
                                  labelText: 'Date',
                                  hintText: 'jj/mm/aa',
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
                            InkWell(
                              onTap: () {
                                //_addUser();
                                cek();
                                print("id user is: $id_user ");
                                print("email is : ${widget.value} ");
                                print("name is : $name ");
                                print("id_res is : ${widget.id_restaurant} ");
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
                                        child: Text('ADD',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat')),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 80.0,
                              child: Container(
                                decoration: new BoxDecoration(
                                  image: new DecorationImage(
                                      image:
                                      AssetImage('assets/images/bback.png')),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lastapp/service/ApiUrl.dart';
import 'package:lastapp/views/option_page/restaurant.dart';

import '../../models/User.dart';
import '../../service/Services.dart';
import '../signup.dart';

class EditProfil extends StatefulWidget {
  final String value;

  EditProfil({Key key, this.value});

  final String title = 'E-RESTAURANT';

  @override
  EditProfilState createState() => EditProfilState();
}

class EditProfilState extends State<EditProfil> {
  var id, last_name, first_name, email, password, profile;

  bool _isUpdating;
  String _titleProgress;
  String _email;
  GlobalKey<ScaffoldState> _scaffoldKey;
  TextEditingController _idController;
  TextEditingController _last_nameController;
  TextEditingController _first_nameController;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _profileController;

  @override
  void initState() {
    super.initState();
    id;
    profile = "";
    last_name = "";
    first_name = "";
    email = "";
    password = "";
    _isUpdating = false;
    _email = widget.value;
    _titleProgress = widget.title;
    _scaffoldKey = GlobalKey();
    _getOne();
    _idController = TextEditingController();
    _last_nameController = TextEditingController();
    _first_nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _profileController = TextEditingController();
    _showValues();
  }

  _showProgress(String message) {
    setState(() {
      _titleProgress = message;
    });
  }

  _showSnackBar(context, message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<List<User>> _getOne() async {
    var msg = "";
    print("getOneUser $_email");
    final response = await http.post(ApiUrl.getOne, body: {
      "email": _email,
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
        id = datauser[0]['id_user'];
        last_name = datauser[0]['last_name'];
        first_name = datauser[0]['first_name'];
        email = datauser[0]['email'];
        password = datauser[0]['password'];
        profile = datauser[0]['profile'];
        _showValues();
      });
    }
    return datauser;
  }

  _updateUser() {
    setState(() {
      _isUpdating = true;
    });
    _showProgress('Updating User...');
    Services.updateUser(
        id.toString(),
        _last_nameController.text,
        _first_nameController.text,
        _emailController.text,
        _passwordController.text,
        _profileController.text)
        .then((result) {
      if ('success' == result) {
        setState(() {
          _isUpdating = false;
          last_name = _last_nameController.text;
          first_name = _first_nameController.text;
          email = _emailController.text;
          password = _passwordController.text;
          profile = _profileController.text;
        });
        _clearValues();
        _showValues();
        Pop_up_Update();
      }
    });
  }

  _deleteUser() {
    _showProgress('Deleting User...');
    Services.deleteUser(id.toString()).then((result) {
      if ('success' == result) {
        var route = new MaterialPageRoute(
          builder: (BuildContext context) => new SignupPage(),
        );
        Navigator.of(context).push(route);

        Pop_up_Delete();
      }
    });
  }

  _clearValues() {
    _last_nameController.text = '';
    _first_nameController.text = '';
    _emailController.text = '';
    _passwordController.text = '';
    _profileController.text = '';
  }

  _showValues() {
    _last_nameController.text = last_name;
    _first_nameController.text = first_name;
    _emailController.text = email;
    _passwordController.text = password;
    _profileController.text = profile;
  }

  int Pop_up_Update() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(" $last_name $first_name ",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat')),
            content: Text("your modification has been successfully completed",
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

  int Pop_up_Delete() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(" $last_name $first_name ",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat')),
            content: Text("your account has been successfully deleted",
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
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Image.asset(
              "assets/images/costumer.jpg",
              fit: BoxFit.cover,
            ),
          ),
          DraggableScrollableSheet(
            minChildSize: 0.1,
            initialChildSize: 0.22,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 32, right: 32, top: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                                height: 100,
                                width: 100,
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/images/costumer.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            SizedBox(
                              width: 16,
                            ),
                            Expanded(


                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: <Widget>[

                                  Text(
                                    "$last_name $first_name ",
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontFamily: "Roboto",
                                        fontSize: 36,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.only(
                                      top: 35.0, left: 20.0, right: 20.0),
                                  child: Column(
                                    children: <Widget>[
                                      TextField(
                                        controller: _last_nameController,
                                        decoration: InputDecoration(
                                            labelText: "LASTNAME",
                                            labelStyle: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.green))),
                                      ),
                                      SizedBox(height: 10.0),
                                      TextField(
                                        controller: _first_nameController,
                                        decoration: InputDecoration(
                                            labelText: "FIRSTNAME",
                                            labelStyle: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.green))),
                                      ),
                                      SizedBox(height: 10.0),
                                      TextField(
                                        controller: _emailController,
                                        decoration: InputDecoration(
                                            labelText: "EMAIL",
                                            labelStyle: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.green))),
                                      ),
                                      SizedBox(height: 10.0),
                                      TextField(
                                        controller: _passwordController,
                                        decoration: InputDecoration(
                                            labelText: "PASSWORD",
                                            labelStyle: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.green))),
                                      ),
                                      TextField(
                                        controller: _profileController,
                                        decoration: InputDecoration(
                                            labelText: "PROFILE",
                                            labelStyle: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.green))),
                                      ),
                                      SizedBox(height: 40.0),
                                      InkWell(
                                        onTap: () {
                                          _updateUser();
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
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <Widget>[
                                                SizedBox(width: 10.0),
                                                Center(
                                                  child: Text('Modify',
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          fontFamily:
                                                          'Montserrat')),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 40.0),
                                      InkWell(
                                        onTap: () {
                                          _deleteUser();
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
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <Widget>[
                                                SizedBox(width: 10.0),
                                                Center(
                                                  child: Text('delete',
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          fontFamily:
                                                          'Montserrat')),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                          onTap: () {
                                            var route = new MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                              new Restaurant(
                                                  value: widget.value),
                                            );
                                            Navigator.of(context).push(route);
                                          },
                                          child: Container(
                                            height: 80.0,
                                            child: Container(
                                              decoration: new BoxDecoration(
                                                image: new DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/bback.png')),
                                              ),
                                            ),
                                          ))
                                    ],
                                  )),
                            ],
                          )),

                      //performace bar
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

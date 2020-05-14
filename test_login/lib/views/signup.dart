import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../service/Services.dart';

class SignupPage extends StatefulWidget {
  SignupPage() : super();

  final String title = 'E-RESTAURANT';

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  GlobalKey<ScaffoldState> _scaffoldKey;


  TextEditingController _last_nameController;

  TextEditingController _first_nameController;


  TextEditingController _emailController;


  TextEditingController _passwordController;
  TextEditingController _profileController;

  String _titleProgress;

  @override
  void initState() {
    super.initState();

    _titleProgress = widget.title;
    _scaffoldKey = GlobalKey();
    _last_nameController = TextEditingController();
    _first_nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _profileController = TextEditingController();
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

  _addUser() {
    if (_last_nameController.text.isEmpty ||
        _first_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _profileController.text.isEmpty) {
      print('Empty Fields');
      return;
    }
    _showProgress('Adding User...');
    Services.addUser(
        _last_nameController.text,
        _first_nameController.text,
        _emailController.text,
        _passwordController.text,
        _profileController.text)
        .then((result) {
      if ('success' == result) {

        _clearValues();
        popup();
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(20.0, 110.0, 0.0, 0.0),
                          child: Text('Find your destination',
                              style: TextStyle(
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green)),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(75.0, 170.0, 0.0, 0.0),
                          child: Text('Register now',
                              style: TextStyle(
                                  fontSize: 40.0, color: Colors.green)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      padding:
                      EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            controller: _last_nameController,
                            decoration: InputDecoration(
                                labelText: 'LAST NAME',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.green))),

                          ),
                          SizedBox(height: 10.0),
                          TextField(
                            controller: _first_nameController,
                            decoration: InputDecoration(
                                labelText: 'FIRST NAME',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.green))),
                            //obscureText: true,
                          ),
                          SizedBox(height: 10.0),
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                labelText: 'EMAIL',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.green))),

                          ),
                          SizedBox(height: 10.0),
                          TextField(
                            controller: _passwordController,
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
                          SizedBox(height: 10.0),
                          TextField(
                            controller: _profileController,
                            decoration: InputDecoration(
                                labelText: 'PROFIL',
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
                              _addUser();
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
                                      child: Text('Signup',
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
                ],
              ),
            )
          ],
        ));
  }
}

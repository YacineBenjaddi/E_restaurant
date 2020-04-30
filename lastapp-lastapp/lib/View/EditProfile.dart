import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Controller/Services.dart';
import '../Model/User.dart';

class EditProfil extends StatefulWidget {
  final String value;

  EditProfil({Key key, this.value});

  final String title = 'E-RESTAURANT';

  @override
  EditProfilState createState() => EditProfilState();
}

class EditProfilState extends State<EditProfil> {
  var id, nom, prenom, email, password, profil;

  bool _isUpdating;
  String _titleProgress;
  String _email;
  GlobalKey<ScaffoldState> _scaffoldKey;
  TextEditingController _idController;
  TextEditingController _nomController;
  TextEditingController _prenomController;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _profilController;

  @override
  void initState() {
    super.initState();
    id;
    profil = "";
    nom = "";
    prenom = "";
    email = "";
    password = "";
    _isUpdating = false;
    _email = widget.value;
    _titleProgress = widget.title;
    _scaffoldKey = GlobalKey(); // key to get the context to show a SnackBar
    _getOne();
    _idController = TextEditingController();
    _nomController = TextEditingController();
    _prenomController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _profilController = TextEditingController();
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
    final response = await http.post("http://192.168.1.5/Test/get.php", body: {
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
        nom = datauser[0]['nom'];
        prenom = datauser[0]['prenom'];
        email = datauser[0]['email'];
        password = datauser[0]['password'];
        profil = datauser[0]['profil'];
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
            _nomController.text,
            _prenomController.text,
            _emailController.text,
            _passwordController.text,
            _profilController.text)
        .then((result) {
      if ('success' == result) {
        setState(() {
          _isUpdating = false;
          nom = _nomController.text;
          prenom = _prenomController.text;
          email = _emailController.text;
          password = _passwordController.text;
          profil = _profilController.text;
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
        Navigator.of(context).pushNamed('/signup');
        Pop_up_Delete();
      }
    });
  }

  _clearValues() {
    _nomController.text = '';
    _prenomController.text = '';
    _emailController.text = '';
    _passwordController.text = '';
    _profilController.text = '';
  }

  _showValues() {
    _nomController.text = nom;
    _prenomController.text = prenom;
    _emailController.text = email;
    _passwordController.text = password;
    _profilController.text = profil;
  }

  int Pop_up_Update() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(" $nom $prenom ",
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
            title: Text(" $nom $prenom ",
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
              "assets/images/myphoto.jpg",
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
                      //for user profile header
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
                                    'assets/images/myphoto.jpg',
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
                                    "$nom $prenom",
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
                                    controller: _nomController,
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
                                    controller: _prenomController,
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
                                    controller: _profilController,
                                    decoration: InputDecoration(
                                        labelText: "PROFIL",
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
                                        Navigator.of(context)
                                            .pushNamed('/signup');
                                        //_updateUser();
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

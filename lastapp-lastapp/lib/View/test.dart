import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:lastapp/Controller/Services.dart';
import 'package:lastapp/Model/User.dart';
import 'package:http/http.dart' as http;

class test extends StatefulWidget {
  //
  final String  value;

  // DataTableDemo() : super();
  test({Key key,this.value});

  final String title = 'E-RESTAURANT';

  @override
  testState createState() => testState();
}

class testState extends State<test> {
 List<User> _users;
 GlobalKey<ScaffoldState> _scaffoldKey;
 // controller for the First Name TextField we are going to create.
 TextEditingController _nomController;
 // controller for the Last Name TextField we are going to create.
 TextEditingController _prenomController;
 // controller for the email TextField we are going to create.
 TextEditingController _emailController;
 // controller for the password TextField we are going to create.
 TextEditingController _passwordController;
 TextEditingController _profilController;

 User _selectedUser;
 var id,nom,prenom,email,password,profil;
 bool _isUpdating;
 String _titleProgress;
 String  _email;


  @override
  void initState() {
    super.initState();
    _users=[];
    id;
    nom="";
    prenom="";
    email="";
    password="";
    profil="";
    _isUpdating = false;
    _email= widget.value;
    _titleProgress = widget.title;
    _scaffoldKey = GlobalKey(); // key to get the context to show a SnackBar
    _nomController = TextEditingController();
    _prenomController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _profilController = TextEditingController();
    //_getUsers();
    // _getOneUser();
    _getOne();
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
   var msg="";
   print("getOneUser $_email");
   final response = await http.post("http://192.168.1.5/Test/get.php", body: {
     // print("$_email");
     "email": _email,
   });
   var datauser = json.decode(response.body);
   User user;
   print(datauser);

   if(datauser.length==0){
     setState(() {
       msg="Login Fail";
     });
   }

   if(datauser.length>0){
     setState(() {
       id=datauser[0]['id_user'];
       nom=datauser[0]['nom'];
       prenom=datauser[0]['prenom'];
       email=datauser[0]['email'];
       password=datauser[0]['password'];
       profil=datauser[0]['profil'];

       _nomController.text=nom;
       _prenomController.text=prenom;
       _emailController.text=email;
       _passwordController.text=password;
       _profilController.text=profil;
     });
   }
   return datauser;
 }
_updateUser() {
  setState(() {
    _isUpdating = true;
  });
  //_showProgress('Updating User...');
  Services.updateUser(id.toString(), _nomController.text, _prenomController.text,_emailController.text, _passwordController.text ,_profilController.text).then((result) {
    if ('success' == result) {
      //  _getUsers(); // Refresh the list after update
      setState(() {
        _isUpdating = false;
        print("name : $nom");
        print("id est ============================= $id");
        print("looooooooooooool");
        //  print("nom = $_nomController prenom = $_prenomController email = $_emailController password = $_passwordController ");
      });
      _clearValues();
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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(

          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(image: new DecorationImage(image: AssetImage('assets/images/dest.jpg'), fit: BoxFit.fill)
              ),
            ),
            //modif
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
                                  fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.green)),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20.0, 175.0, 0.0, 0.0),
                          child: Text('Register now',
                              style: TextStyle(
                                  fontSize: 40.0, color: Colors.green)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            controller: _nomController,
                            decoration: InputDecoration(
                                labelText: '${ nom}',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green))),
                            // obscureText: true,
                          ),
                          SizedBox(height: 10.0),
                          TextField(
                            controller: _prenomController,
                            decoration: InputDecoration(
                                labelText:  "${ prenom}",
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green))),
                            //obscureText: true,
                          ),
                          SizedBox(height: 10.0),
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                labelText: '${ email}',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green))),
                            //obscureText: true,
                          ),
                          SizedBox(height: 10.0),
                          TextField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                                labelText: '${ password}',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green))),
                            obscureText: true,
                          ),
                          SizedBox(height: 10.0),
                          TextField(
                            controller: _profilController,
                            decoration: InputDecoration(
                                labelText: '${ profil}',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green))),
                            //obscureText: true,
                          ),
                          SizedBox(height: 40.0),
                          InkWell(
                            onTap: () {
                             // _addUser();
                             // popup(context);
                              // Navigator.of(context).pushNamed('/signup');
                              _updateUser();
                              _showValues();
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
                            child: Container(decoration: new BoxDecoration(image: new DecorationImage(image: AssetImage('assets/images/bback.png')
                            ),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Services.dart';
import 'main.dart';
import 'User.dart';

class SignupPage extends StatefulWidget {
  SignupPage() : super();

  final String title = 'E-RESTAURANT';
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

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
  bool _isUpdating;
  String _titleProgress;

  @override
  void initState() {
    super.initState();
    _users = [];
    _isUpdating = false;
    _titleProgress = widget.title;
    _scaffoldKey = GlobalKey(); // key to get the context to show a SnackBar
    _nomController = TextEditingController();
    _prenomController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _profilController = TextEditingController();
    _getUsers();
  }

  // Method to update title in the AppBar Title
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


  _createTable() {
    _showProgress('Creating Table...');
    Services.createTable().then((result) {
      if ('success' == result) {
        // Table is created successfully.
        _showSnackBar(context, result);
        _showProgress(widget.title);
      }
    });
  }

//popup
  int popup(context){

    showModalBottomSheet(context: context, builder: (BuildContext bc){
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: ClampingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height * .15,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('votre connexion a été effectuer avec succès !',
                        style: TextStyle(fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Montserrat')),

                        IconButton(
                          icon: Icon(Icons.cancel, color: Colors.red,size: 30,),
                          onPressed :() {
                            Navigator.of(context).pop();
                            _clearValues();
                          },
                        )


                ],
              ),
            ],
          ),

        )
        ),

      );

    });

  }

  // Now lets add a User
  _addUser() {
    if (_nomController.text.isEmpty || _prenomController.text.isEmpty || _emailController.text.isEmpty || _passwordController.text.isEmpty || _profilController.text.isEmpty) {
      print('Empty Fields');
      return;
    }
    _showProgress('Adding User...');
    Services.addUser(_nomController.text, _prenomController.text,_emailController.text, _passwordController.text ,_profilController.text).then((result) {
      if ('success' == result) {
        _getUsers(); // Refresh the List after adding each employee...
        _clearValues();
      }
    });
  }

  _getUsers() {
    _showProgress('Loading User...');
    Services.getUsers().then((users) {
      setState(() {
        _users = users;
      });
      _showProgress(widget.title); // Reset the title...
      print("Length ${users.length}");
    });
  }

  // Method to clear TextField values
  _clearValues() {
    _nomController.text = '';
    _prenomController.text = '';
    _emailController.text = '';
    _passwordController.text = '';
    _profilController.text = '';
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
                                labelText: 'LAST NAME',
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
                                labelText: 'FIRST NAME',
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
                                labelText: 'EMAIL',
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
                                labelText: 'PASSWORD',
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
                                labelText: 'PROFIL',
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
                          _addUser();
                          popup(context);
                          //Navigator.of(context).pushNamed('/signup');

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
    //  Navigator.of(context).pushNamed('/main');
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

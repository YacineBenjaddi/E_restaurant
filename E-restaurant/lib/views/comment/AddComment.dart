import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/views/comment/main.dart';

import '../../service/comment-api.dart';

class AddPage extends StatefulWidget {
  final String id_restaurant,value,imagePath,name_rest,information;
  final double lat,long;
  AddPage({this.id_restaurant,this.value,this.imagePath,this.name_rest,this.long,this.lat,this.information});

 // AddPage() : super();

  final String title = 'E-RESTAURANT';


  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  GlobalKey<ScaffoldState> _scaffoldKey;

  TextEditingController _titleController;
  TextEditingController _textoController;
//  TextEditingController _nameController;
  TextEditingController _ratingController;
 // TextEditingController _name_restauController;

  String _titleProgress;

  @override
  void initState() {
    super.initState();

    _scaffoldKey = GlobalKey();
    _titleController = TextEditingController();
    _textoController = TextEditingController();
  //  _nameController = TextEditingController();
    _ratingController = TextEditingController();
    //_name_restauController = TextEditingController();
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

  _addComment() {
    if (_titleController.text.isEmpty ||
        _textoController.text.isEmpty ||
       // _nameController.text.isEmpty ||
        _ratingController.text.isEmpty )
       // _name_restauController.text.isEmpty)
        {
      print('Empty Fields');
      return;
    }
    _showProgress('Adding Comment...');
    addComment(
        _titleController.text,
        _textoController.text,
        name=widget.value,
        _ratingController.text,
        id_restaurant=widget.id_restaurant)
        .then((result) {
      if ('success' == result) {

        _clearValues();
        popup();
      }
    });
  }

  _clearValues() {
    _titleController.text = '';
    _textoController.text = '';
   // _nameController.text = '';
    _ratingController.text = '';
   // _name_restauController.text = '';
  }

  String title,texto,name,rating,id_restaurant;
  var key = new GlobalKey<FormState>();
  cek(){
    final form = key.currentState;
    print(form);
    if(form.validate()){
      form.save();
      _addComment();
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.indigo,
        leading: Container(
        margin: EdgeInsets.only(left: 25),
    child: IconButton(
    icon:new Icon(Icons.arrow_back,
    color: Colors.white,

    ),
    onPressed: () {
    // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    var route=new MaterialPageRoute(
    builder: (BuildContext context)=>
    new maincomment(id_restaurant:widget.id_restaurant,name:widget.name_rest,imagePath:widget.imagePath,information:widget.information,value:widget.value,lat: widget.lat,long: widget.long),
    );
    Navigator.of(context).push(route);
    })
    )),
        resizeToAvoidBottomPadding: false,
        body: Stack(

          fit: StackFit.expand,
          children: <Widget>[

            Container(



              decoration: new BoxDecoration(
                image: new DecorationImage(
                      image: AssetImage('assets/images/comen.jpg'),
 fit: BoxFit.fill)),
  ),

            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
//                  Container(
//                    child: Stack(
//                      children: <Widget>[
//                        Container(
//                          padding: EdgeInsets.fromLTRB(20.0, 110.0, 0.0, 0.0),
//                          child: Text('Find your destination',
//                              style: TextStyle(
//                                  fontSize: 35.0,
//                                  fontWeight: FontWeight.bold,
//                                  color: Colors.green)),
//                        ),
//                        Container(
//                          padding: EdgeInsets.fromLTRB(75.0, 160.0, 0.0, 0.0),
//                          child: Text('Register now',
//                              style: TextStyle(
//                                  fontSize: 35.0, color: Colors.green)),
//                        ),
//                      ],
//                    ),
//                  ),
                    Form(
                      key:key,
                      child: Container(
                          padding:
                          EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                onSaved: (e) => title = e,
                                validator : (e) {
                                  if (e.isEmpty) {
                                    return "Enter the title of the comment !"
                                    ;
                                  }
                                },

                                controller: _titleController,
                                decoration: InputDecoration(
                                    labelText: 'title',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.black87))),

                              ),
                              SizedBox(height: 10.0),
                              TextFormField(
                                onSaved: (e) => texto = e,
                                validator : (e) {
                                  if (e.isEmpty) {
                                    return "Enter your comment!"
                                    ;
                                  }
                                },

                                controller: _textoController,
                                decoration: InputDecoration(
                                    labelText: 'your comment',
                                    labelStyle: TextStyle(
                                        //fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black87),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.black87))),
                                //obscureText: true,
                              ),
                              SizedBox(height: 10.0),
                              TextFormField(
                                onSaved: (e) => rating = e,
                                validator : (e) {
                                  if (e.isEmpty) {
                                    return "Enter your rating /5!"
                                    ;
                                  }
                                },

                                controller: _ratingController,
                                decoration: InputDecoration(
                                    labelText: '/5',
                                    labelStyle: TextStyle(
                                        //fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black87),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.black87))),

                              ),
                              SizedBox(height: 10.0),
                              SizedBox(height: 40.0),
                              InkWell(
                                onTap: () {
                                  //_addUser();
                                  cek();
                                },
                                child: Container(
                                  height: 40.0,
                                  color: Colors.transparent,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black,
                                            style: BorderStyle.solid,
                                            width: 2.0),
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(20.0)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(width: 10.0),
                                        Center(
                                          child: Text('valider',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                   fontFamily: 'Montserrat',
                                        ),
                                          )),]
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 80.0,
                                child: Container(
                                  decoration: new BoxDecoration(
                                    //image: new DecorationImage(
                                        //image:
                                      //  AssetImage('assets/images/bback.png')),
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
              ),
            )
          ],
        ));
  }
}

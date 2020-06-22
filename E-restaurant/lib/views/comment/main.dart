import 'package:lastapp/views/pages/info_page/main.dart';

import 'StarWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/comment.dart';
import '../../service/comment-api.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'AddComment.dart';

//void maincomment() => runApp(MyApp());

class maincomment extends StatelessWidget {
  final String id_restaurant,value,imagePath,name,information;
  final double lat,long;
  maincomment({this.id_restaurant,this.value,this.imagePath,this.name,this.long,this.lat,this.information});




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: CommentsPage(id_restaurant:this.id_restaurant,name:this.name,imagePath:this.imagePath,information:this.information,value:this.value,lat: this.lat,long: this.long),
    );
  }
}

class CommentsPage extends StatelessWidget {
  final String id_restaurant,value,imagePath,name,information;
  final double lat,long;
  CommentsPage({this.id_restaurant,this.value,this.imagePath,this.name,this.long,this.lat,this.information});
  @override
  Widget build(BuildContext context){
return Scaffold(
      appBar: AppBar(
          actions: <Widget>[
      Container(
          margin: EdgeInsets.only(right: 300),
          child:  IconButton(
              icon:new Icon(Icons.arrow_back),
              onPressed: () {
                var route=new MaterialPageRoute(
                  builder: (BuildContext context)=>
                  new InfoPage(id_restaurant:this.id_restaurant,name:this.name,imagePath:this.imagePath,information:this.information,value:this.value,lat: this.lat,long: this.long),
                );
                Navigator.of(context).push(route);
              }
          )
       ),
    Container(
   // margin: EdgeInsets.only(right: 350),

    child: IconButton(
    icon: Icon(FontAwesomeIcons.comment),
    iconSize: 20.0,
    color: Colors.white,
    onPressed: () {
    var route = new MaterialPageRoute(
    builder: (BuildContext context) => new AddPage(id_restaurant:this.id_restaurant,name_rest:this.name,imagePath:this.imagePath,information:this.information,value:this.value,lat: this.lat,long: this.long),
    );
    Navigator.of(context).push(route);
    }

    )
    )

    ],),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: FutureBuilder(

            future: fetchComments(id_restaurant),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index){
                    Comments comment = snapshot.data[index];
                    return Container(
                      margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 5.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                        decoration : BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 7.0,
                                offset: Offset(2.0,2.0,),
                              ),
                            ]
                        ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.20,
                                            child: Text('${comment.title}', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300, color: Colors.black38),),
                                          ),
                                          Container(
                                            height: MediaQuery.of(context).size.height * 0.02,
                                            width: MediaQuery.of(context).size.width * 0.20,
                                            child: StarWidget(
                                            numberOfStars: int.parse('${comment.rating}'.toString()),
                                          ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.70,
                                            child: Text('${comment.name}', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.black),),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.65,
                                            child: Text('${comment.texto}', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300, color: Colors.black87),),
                                          ),
                                        ],
                                      ),
                                      ]
                                ),
                              ],
                        ),
                    );
                  },

                );

              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),

    );

  }
}
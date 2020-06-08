import 'package:comments/StarWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:comments/comment.dart';
import 'package:comments/comment-api.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: CommentsPage(),
    );
  }
}

class CommentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            iconSize: 20.0,
            color: Colors.white,
            onPressed: () {
            }
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: FutureBuilder(
            future: fetchComments(),
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
                                            child: Text('${comment.name}', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300, color: Colors.black38),),
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
                                            child: Text('${comment.title}', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.black),),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.65,
                                            child: Text('${comment.text}', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300, color: Colors.black87),),
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
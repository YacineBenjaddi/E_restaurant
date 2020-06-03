import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../pages/info_page/main.dart';

class frequenlyRestaurant extends StatefulWidget {
  final String id;
  final String name;
  final String imagePath;
  final String category;
  final double discount;
  final double ratings;
  final double lat;
  final double long;
  final String information;


  frequenlyRestaurant(
      {this.id,
        this.name,
        this.imagePath,
        this.category,
        this.discount,
        this.ratings,
        this.lat,
        this.long,
        this.information

      });

  @override
  _frequenlyRestaurant createState() => _frequenlyRestaurant();
}

class _frequenlyRestaurant extends State<frequenlyRestaurant> {
  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: InkWell(
          child: Stack(

            children: <Widget>[

              Container(


                height: 200.0,
                width: 340.0,
                child: Image.asset(
                  widget.imagePath,
                  fit: BoxFit.cover,

                ),
              ),
              Positioned(
                left: 0.0,
                bottom: 0.0,
                child: Container(
                  height: 60.0,
                  width: 340.0,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black, Colors.black12],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      )),
                ),
              ),
              Positioned(
                left: 10.0,
                bottom: 0.0,
                child: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold)),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Theme.of(context).primaryColor,
                              size: 16.0,
                            ),
                            Icon(
                              Icons.star,
                              color: Theme.of(context).primaryColor,
                              size: 16.0,
                            ),
                            Icon(
                              Icons.star,
                              color: Theme.of(context).primaryColor,
                              size: 16.0,
                            ),
                            Icon(
                              Icons.star,
                              color: Theme.of(context).primaryColor,
                              size: 16.0,
                            ),
                            Icon(
                              Icons.star,
                              color: Theme.of(context).primaryColor,
                              size: 16.0,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              "(" + widget.ratings.toString() + " %)",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: 40.0,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          "discount" + widget.discount.toString() + " %",
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.orangeAccent),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],

          ),

          onTap: () {
            var route=new MaterialPageRoute(
                builder: (BuildContext context)=>
                new InfoPage(name: widget.name,imagePath: widget.imagePath,information: widget.information,long:widget.long, lat:widget.lat)
              //)
            );
            Navigator.of(context).push(route);
          }
      ),
    );
  }
}

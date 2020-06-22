import 'package:flutter/material.dart';

import '../../pages/dishes/main.dart';

class SheetContainer extends StatelessWidget {
  final String id_restaurant,name,imagePath,information,value;
  SheetContainer({Key key,this.id_restaurant,this.name,this.imagePath,this.information,this.value}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    double sheetItemHeight = 110;
    return Container(
        padding: EdgeInsets.only(top: 25),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            color: Color(0xfff1f1f1)),
        child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 200.0,
                      child: Text(
                        '$name',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0),
                      ),
                    ),
                    SizedBox(height: 32.0),
                    Text("$information ",
                        style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 1.1,
                            fontSize: 22.0)),
                    SizedBox(height: 32.0),
                    Center(

                      child: FlatButton(
                        textColor: Colors.white,
                        color: Colors.blueAccent,

                        child: Text('explore Dishes ',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Montserrat')),
                        onPressed: () {
                          var route = new MaterialPageRoute(
                            builder: (BuildContext context) => new MyApp(),
                          );
                          Navigator.of(context).push(route);
                          // TODO

                        },
                      ),
                    ),
//                    SizedBox(height: 32.0),
//                    itemRow(Icons.star, 'Service', '8/10'),
//                    SizedBox(height: 22.0),
//                    itemRow(Icons.ac_unit, 'Cuisine', '8.2/10'),
//                    SizedBox(height: 22.0),
//                    itemRow(Icons.straighten, 'Ambiance', '8.7/10'),
//                    SizedBox(height: 12.0),
//                    Container(
//                        child: Text(
//                          ' CUISINES:\n'
//                              ' Française, Européenne, Méditerranéenne.\n\n'
//                              ' RÉGIMES SPÉCIAUX:\n'
//                              ' Végétariens bienvenus.\n\n'
//                              ' REPAS:\n'
//                              ' Déjeuner, Dîner, Ouvert tard.\n\n'
//                              ' FONCTIONNALITÉS:\n'
//                              ' Réservations, Terrasse, Places assises, Accès personnes handicapées, Sert de lalcool.',
//
//                          style: TextStyle(
//                              color: Colors.black,
//                              fontWeight: FontWeight.bold,
//                              fontSize: 15.0),
//
//
//                        )
//
//                    ),



                  ],
                ),

              )]) );
  }
}
  itemRow(icon, name, title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.black,
            ),
            SizedBox(width: 6.0),
            Text(
              name,
              style: TextStyle(color: Colors.black, fontSize: 20.0),
            )
          ],
        ),
        Text(title, style: TextStyle(color: Colors.grey, fontSize: 20.0))
      ],
    );
  }
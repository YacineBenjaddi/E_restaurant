import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/service/scoped_model/restaurant_model.dart';
import 'bloc/state_bloc.dart';
import 'bloc/state_provider.dart';
import 'model/restaurant.dart';
import '../gps/homepage.dart';
import "../../pages/home_page.dart";


//void main() => runApp(MyApp());

//var currentRestaurant = restaurantList.restaurants[0];

class InfoPage extends StatelessWidget {

  final String name,imagePath,information;
 // final Restaurant_model restaurantmodel;

  InfoPage({Key key,this.name,this.imagePath,this.information}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainApp(name:this.name,imagePath:this.imagePath,information:this.information),
    );
  }
}

class MainApp extends StatelessWidget {
  final String name,imagePath,information;
  MainApp({Key key,this.name,this.imagePath,this.information}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Container(
            margin: EdgeInsets.only(left: 25),
            child: IconButton(
                icon:new Icon(Icons.arrow_back,
              color: Colors.white,

                       ),
                onPressed: () {
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));

                })
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 25),
            child:  IconButton(
                icon:new Icon(Icons.location_on),
              onPressed: () {
                var route=new MaterialPageRoute(
                  builder: (BuildContext context)=>
                  new HomePage1(),
                );
                //print("Card tapped in ${widget.information}");
                // Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPage()))
                Navigator.of(context).push(route);
              }
          ))
        ],
      ),
      backgroundColor: Colors.blueAccent,
      body: LayoutStarts(name:this.name,imagePath:this.imagePath,information:this.information),
    );
  }
}

class LayoutStarts extends StatelessWidget {
  final String name,imagePath,information;
  LayoutStarts({Key key,this.name,this.imagePath,this.information}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CarDetailsAnimation(name:this.name,imagePath:this.imagePath,information:this.information),
        CustomBottomSheet(name:this.name,imagePath:this.imagePath,information:this.information),
      ],
    );
  }
}


class CarDetailsAnimation extends StatefulWidget {
  final String name,imagePath,information;
  CarDetailsAnimation({Key key,this.name,this.imagePath,this.information}) : super(key:key);
  @override

  _CarDetailsAnimationState createState() => _CarDetailsAnimationState();
}

class _CarDetailsAnimationState extends State<CarDetailsAnimation>
    with TickerProviderStateMixin {
  AnimationController fadeController;
  AnimationController scaleController;

  Animation fadeAnimation;
  Animation scaleAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fadeController =
        AnimationController(duration: Duration(milliseconds: 180), vsync: this);

    scaleController =
        AnimationController(duration: Duration(milliseconds: 350), vsync: this);

    fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(fadeController);
    scaleAnimation = Tween(begin: 0.8, end: 1.0).animate(CurvedAnimation(
      parent: scaleController,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
    ));
  }

  forward() {
    scaleController.forward();
    fadeController.forward();
  }

  reverse() {
    scaleController.reverse();
    fadeController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        initialData: StateProvider().isAnimating,
       // stream: stateBloc.animationStatus,
        builder: (context, snapshot) {
          snapshot.data ? forward() : reverse();

          return ScaleTransition(
            scale: scaleAnimation,
            child: FadeTransition(
              opacity: fadeAnimation,
              child: CarDetails(name:widget.name,imagePath:widget.imagePath,information:widget.information),
            ),
          );
        });
  }
}

class CarDetails extends StatelessWidget {
  final String name,imagePath,information;
  CarDetails({Key key,this.name,this.imagePath,this.information}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 30),
              child: _carTitle(),
            ),
            Container(
              width: double.infinity,
              child: InfoPage1(name:this.name,imagePath:this.imagePath,information:this.information),
            )
          ],
        ));
  }

  _carTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RichText(
          text: TextSpan(
              style: TextStyle(color: Colors.white, fontSize: 20),
              children: [
                //TextSpan(text: "Restaurant"),
               // TextSpan(text: "\n"),
                TextSpan(
                    text: this.name,
                    style: TextStyle(fontWeight: FontWeight.w100, fontSize: 25.0)),
              ]),
        ),
      ],
    );
  }
}

/*class CarCarousel extends StatefulWidget {
  @override
  _CarCarouselState createState() => _CarCarouselState();
}

class _CarCarouselState extends State<CarCarousel> {
  static final List<String> imgList = currentRestaurant.imgList;

  final List<Widget> child = _map<Widget>(imgList, (index, String assetName) {
    return Container(
        child: Image.asset("assets/$assetName", fit: BoxFit.fitWidth));
  });

  static List<T> _map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CarouselSlider(
            height: 250,
            viewportFraction: 1.0,
            items: child,
            onPageChanged: (index) {
              setState(() {
                _current = index;
              });
            },
          ),
          Container(
            margin: EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: _map<Widget>(imgList, (index, assetName) {
                return Container(
                  width: 50,
                  height: 2,
                  decoration: BoxDecoration(
                      color: _current == index
                          ? Colors.grey[100]
                          : Colors.grey[600]),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}*/
class InfoPage1 extends StatefulWidget{
  final String name,imagePath,information;
  InfoPage1({Key key,this.name,this.imagePath,this.information}) : super(key:key);
  @override
  _InfoPage1State createState() => _InfoPage1State();
}

class _InfoPage1State extends State<InfoPage1> {
  @override
  Widget build(BuildContext context) {
     return Container(
              padding: const EdgeInsets.all(2.0),


             child:   new Image.asset(
                  widget.imagePath,
                  fit: BoxFit.cover,
                  width: 150.0,
                  height: 250.0,
                ),



            );


  }
}

class CustomBottomSheet extends StatefulWidget {
  final String name,imagePath,information;
  CustomBottomSheet({Key key,this.name,this.imagePath,this.information}) : super(key:key);
  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet>
    with SingleTickerProviderStateMixin {
  double sheetTop = 400;
  double minSheetTop = 30;

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    animation = Tween<double>(begin: sheetTop, end: minSheetTop)
        .animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      });
  }

  forwardAnimation() {
    controller.forward();
    stateBloc.toggleAnimation();
  }

  reverseAnimation() {
    controller.reverse();
    stateBloc.toggleAnimation();
  }

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: animation.value,
      left: 0,
      child: GestureDetector(
        onTap: () {
          controller.isCompleted ? reverseAnimation() : forwardAnimation();
        },
        onVerticalDragEnd: (DragEndDetails dragEndDetails) {
          //upward drag
          if (dragEndDetails.primaryVelocity < 0.0) {
            forwardAnimation();
            controller.forward();
          } else if (dragEndDetails.primaryVelocity > 0.0) {
            //downward drag
            reverseAnimation();
          } else {
            return;
          }
        },
        child: SheetContainer(name:widget.name,imagePath:widget.imagePath,information:widget.information),
      ),
    );
  }
}

class SheetContainer extends StatelessWidget {
  final String name,imagePath,information;
  SheetContainer({Key key,this.name,this.imagePath,this.information}) : super(key:key);
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
                    Text("$information",
                        style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 1.1,
                            fontSize: 22.0)),
                    SizedBox(height: 32.0),
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
                    SizedBox(height: 42.0),
                    itemRow(Icons.star, 'Service', '8/10'),
                    SizedBox(height: 22.0),
                    itemRow(Icons.ac_unit, 'Cuisine', '8.2/10'),
                    SizedBox(height: 22.0),
                    itemRow(Icons.straighten, 'Ambiance', '8.7/10'),
                    SizedBox(height: 32.0),
                    Container(
                        child: Text(
                          ' CUISINES:\n'
                              ' Française, Européenne, Méditerranéenne.\n\n'
                              ' RÉGIMES SPÉCIAUX:\n'
                              ' Végétariens bienvenus.\n\n'
                              ' REPAS:\n'
                              ' Déjeuner, Dîner, Ouvert tard.\n\n'
                              ' FONCTIONNALITÉS:\n'
                              ' Réservations, Terrasse, Places assises, Accès personnes handicapées, Sert de lalcool.',

                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0),


                        )

                    ),
                  ],
                ),

              )]) );
  }

  drawerHandle() {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      height: 3,
      width: 65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Color(0xffd9dbdb)),
    );
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

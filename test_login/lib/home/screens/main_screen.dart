import 'package:flutter/material.dart';
import '../scoped_model/restaurant_model.dart';
import '../pages/home_page.dart';
import '../pages/fav_page.dart';
import '../pages/profile_page.dart';
class MainScreen extends StatefulWidget {
  final Restaurant_model restaurantmodel;
  MainScreen({this.restaurantmodel});
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTabIndex=0;
  List<Widget>pages;
  Widget currentPage;
  HomePage homePage;
  ProfilePage profilPage;
  FavPage favPage;
  @override
  void initState(){
    widget.restaurantmodel.fetchRestau();
    homePage=HomePage(widget.restaurantmodel);
    favPage=FavPage();
    profilPage=ProfilePage();
    pages=[homePage,favPage,profilPage];
    currentPage=homePage;
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index){
          setState(() {
            currentTabIndex=index;
            currentPage=pages[index];
          });
        },
        currentIndex: currentTabIndex,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text("Favorite")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile")
          ),

      ]
      ),
      body: currentPage,
    );
  }
}

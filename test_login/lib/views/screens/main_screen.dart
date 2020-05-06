import 'package:flutter/material.dart';
import '../../service/scoped_model/restaurant_model.dart';
import '../pages/home_page.dart';
import '../pages/fav_page.dart';
import '../pages/profile_page.dart';
import '../pages/EditProfile.dart';
class MainScreen extends StatefulWidget {
  final Restaurant_model restaurantmodel;
  final String value;
  MainScreen({this.restaurantmodel,this.value});
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTabIndex=0;
  List<Widget>pages;
  Widget currentPage;
  HomePage homePage;
  ProfilePage profilPage;
  //EditProfil editProfil;
  FavPage favPage;
  @override
  void initState(){
    widget.restaurantmodel.fetchRestau();
    homePage=HomePage(widget.restaurantmodel);
    favPage=FavPage();
    profilPage=ProfilePage(value: widget.value);
    //editProfil=EditProfil();
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

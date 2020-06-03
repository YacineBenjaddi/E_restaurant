import 'package:flutter/material.dart';
import 'package:lastapp/service/scoped_model/main_model.dart';
import '../../service/scoped_model/restaurant_model.dart';
import '../pages/home_page.dart';
import '../pages/fav_page.dart';
import '../pages/profile_page.dart';
import '../pages/EditProfile.dart';
class MainScreen extends StatefulWidget {
  final MainModel model;
  final String value;
  MainScreen({this.model,this.value});
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTabIndex=2;
  List<Widget>pages;
  Widget currentPage;
  HomePage homePage;
  EditProfil profilPage;
  FavPage favPage;

  @override
  void initState(){
    widget.model.fetchRestau();
    homePage=HomePage();
    favPage=FavPage();
    profilPage=EditProfil(value: widget.value);
    pages=[homePage,favPage,profilPage];
    currentPage=profilPage;
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

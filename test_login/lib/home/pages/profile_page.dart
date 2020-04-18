import 'package:flutter/material.dart';
/*
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Profile Page"),
    );
  }*/
  class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
  title: "User Profile",
  debugShowCheckedModeBanner: false,
  home: UserProfilePage(),
  );
  }
  }

  class UserProfilePage extends StatelessWidget {
  final String _nom = "El ouardani";
  final String _profil = "";
  final String _email =
  "manal.elouardani@uir.ac.ma";
  final String _prenom = "Manal";
  //final String _commandes = "23";
  //final String _fadishes = "24";


  Widget _buildCoverImage(Size screenSize) {
  return Container(
  height: screenSize.height / 2.6,
  decoration: BoxDecoration(
  image: DecorationImage(
  image: AssetImage('assets/images/bk.png'),
  fit: BoxFit.cover,
  ),
  ),
  );
  }

  Widget _buildProfileImage() {
  return Center(
  child: Container(
  width: 140.0,
  height: 140.0,
  decoration: BoxDecoration(
  image: DecorationImage(
  image: AssetImage('assets/images/user.png'),
  fit: BoxFit.cover,
  ),
  borderRadius: BorderRadius.circular(80.0),
  border: Border.all(
  color: Colors.white,
  width: 10.0,
  ),
  ),
  ),
  );
  }

  Widget _buildFullName() {
  TextStyle _nameTextStyle = TextStyle(
  fontFamily: 'Roboto',
  color: Colors.black,
  fontSize: 28.0,
  fontWeight: FontWeight.w700,
  );

  return Container(
  child: Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
  _buildStatItem("", _nom),
  _buildStatItem("", _prenom),

  ],
  ),
  );

  }

  Widget _buildStatus(BuildContext context) {
  return Container(
  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
  decoration: BoxDecoration(
  color: Theme.of(context).scaffoldBackgroundColor,
  borderRadius: BorderRadius.circular(4.0),
  ),
  child: Text(
  _profil,
  style: TextStyle(
  fontFamily: 'Spectral',
  color: Colors.black,
  fontSize: 20.0,
  fontWeight: FontWeight.w300,
  ),
  ),
  );
  }

  Widget _buildStatItem(String label, String count) {
  TextStyle _statLabelTextStyle = TextStyle(
  fontFamily: 'Roboto',
  color: Colors.black,
  fontSize: 16.0,
  fontWeight: FontWeight.w200,
  );

  TextStyle _statCountTextStyle = TextStyle(
  color: Colors.black54,
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
  );

  return Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
  Text(
  count,
  style: _statCountTextStyle,
  ),
  Text(
  label,
  style: _statLabelTextStyle,
  ),
  ],
  );
  }

  Widget _buildStatContainer() {
  return Container(
  height: 60.0,
  margin: EdgeInsets.only(top: 8.0),
  decoration: BoxDecoration(
  color: Color(0xFFEFF4F7),
  ),
  /*child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          //_buildStatItem("Commandes", _commandes),
          //_buildStatItem("Likes", _fadishes),

        ],
      ),*/
  );
  }

  Widget _buildemail(BuildContext context) {
  TextStyle bioTextStyle = TextStyle(
  fontFamily: 'Spectral',
  fontWeight: FontWeight.w400,//try changing weight to w500 if not thin
  fontStyle: FontStyle.italic,
  color: Color(0xFF799497),
  fontSize: 16.0,
  );

  return Container(
  color: Theme.of(context).scaffoldBackgroundColor,
  padding: EdgeInsets.all(8.0),
  child: Text(
  _email,
  textAlign: TextAlign.center,
  style: bioTextStyle,
  ),
  );
  }

  Widget _buildSeparator(Size screenSize) {
  return Container(
  width: screenSize.width / 1.6,
  height: 2.0,
  color: Colors.black54,
  margin: EdgeInsets.only(top: 4.0),
  );
  }

  Widget _buildGetInTouch(BuildContext context) {
  return Container(
  color: Theme.of(context).scaffoldBackgroundColor,
  padding: EdgeInsets.only(top: 8.0),
  child: Text(
  "Get in Touch with ${_nom.split(" ")[0]}, ${_prenom.split(" ")[0]}",
  style: TextStyle(fontFamily: 'Roboto', fontSize: 16.0),
  ),
  );
  }

  Widget _buildButtons() {
  return Padding(
  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
  child: Row(
  children: <Widget>[
  Expanded(
  child: InkWell(
  onTap: () => print("message"),
  child: Container(
  height: 40.0,
  decoration: BoxDecoration(
  border: Border.all(),
  color: Color(0xFF404A5C),
  ),
  child: Center(
  child: Text(
  "MESSAGE",
  style: TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w600,
  ),
  ),
  ),
  ),
  ),
  ),
  SizedBox(width: 10.0),
  Expanded(
  child: InkWell(
  onTap: () => print("edit"),
  child: Container(
  height: 40.0,
  decoration: BoxDecoration(
  border: Border.all(),
  color: Color(0xDD199A9D),
  ),
  child: Center(
  child: Padding(
  padding: EdgeInsets.all(10.0),
  child: Text(
  "EDIT ACCOUNT",
  style: TextStyle(color: Colors.white,

  fontWeight: FontWeight.w600,),
  ),
  ),
  ),
  ),
  ),
  ),
  SizedBox(width: 10.0),
  Expanded(
  child: InkWell(
  onTap: () => print("delete"),
  child: Container(
  height: 40.0,
  decoration: BoxDecoration(
  border: Border.all(),
  color: Color(0xFF600F1C),
  ),
  child: Center(
  child: Padding(
  padding: EdgeInsets.all(10.0),
  child: Text(
  "DELETE ACCOUNT",
  style: TextStyle(color: Colors.white,
  fontWeight: FontWeight.w600,),
  ),
  ),
  ),
  ),
  ),
  ),
  ],
  ),
  );
  }


  @override
  Widget build(BuildContext context) {
  Size screenSize = MediaQuery.of(context).size;
  return Scaffold(
  body: Stack(
  children: <Widget>[
  _buildCoverImage(screenSize),
  SafeArea(
  child: SingleChildScrollView(
  child: Column(
  children: <Widget>[
  SizedBox(height: screenSize.height / 6.4),
  _buildProfileImage(),
  _buildFullName(),
  _buildStatus(context),
  _buildStatContainer(),
  _buildemail(context),
  _buildSeparator(screenSize),
  SizedBox(height: 10.0),
  _buildGetInTouch(context),
  SizedBox(height: 8.0),
  _buildButtons(),
  ],
  ),
  ),
  ),
  ],
  ),
  );
  }
  }

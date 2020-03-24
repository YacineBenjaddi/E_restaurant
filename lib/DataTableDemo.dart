import 'package:flutter/material.dart';
import 'User.dart';
import 'Services.dart';
void main() => runApp(DataTableDemo());

class DataTableDemo extends StatefulWidget {
  //
  DataTableDemo() : super();

  final String title = 'E-RESTAURANT';

  @override
  DataTableDemoState createState() => DataTableDemoState();
}

class DataTableDemoState extends State<DataTableDemo> {
  List<User> _users;
  GlobalKey<ScaffoldState> _scaffoldKey;
  // controller for the First Name TextField we are going to create.
  TextEditingController _nomController;
  // controller for the Last Name TextField we are going to create.
  TextEditingController _prenomController;
  // controller for the email TextField we are going to create.
  TextEditingController _emailController;
  // controller for the password TextField we are going to create.
  TextEditingController _passwordController;
  TextEditingController _profilController;

  User _selectedUser;
  bool _isUpdating;
  String _titleProgress;

  @override
  void initState() {
    super.initState();
    _users = [];
    _isUpdating = false;
    _titleProgress = widget.title;
    _scaffoldKey = GlobalKey(); // key to get the context to show a SnackBar
    _nomController = TextEditingController();
    _prenomController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _profilController = TextEditingController();
    _getUsers();
  }

  // Method to update title in the AppBar Title
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

  _createTable() {
    _showProgress('Creating Table...');
    Services.createTable().then((result) {
      if ('success' == result) {
        // Table is created successfully.
        _showSnackBar(context, result);
        _showProgress(widget.title);
      }
    });
  }

  // Now lets add an Employee
  _addUser() {
    if (_nomController.text.isEmpty || _prenomController.text.isEmpty || _emailController.text.isEmpty || _passwordController.text.isEmpty || _profilController.text.isEmpty) {
      print('Empty Fields');
      return;
    }
    _showProgress('Adding User...');
    Services.addUser(_nomController.text, _prenomController.text,_emailController.text, _passwordController.text ,_profilController.text).then((result) {
      if ('success' == result) {
        _getUsers(); // Refresh the List after adding each employee...
        _clearValues();
      }
    });
  }

  _getUsers() {
    _showProgress('Loading User...');
    Services.getUsers().then((users) {
      setState(() {
        _users = users;
      });
      _showProgress(widget.title); // Reset the title...
      print("Length ${users.length}");
    });
  }

  _updateUser(User user) {
    setState(() {
      _isUpdating = true;
    });
    _showProgress('Updating User...');
    Services.updateUser(user.id_user.toString(), _nomController.text, _prenomController.text,_emailController.text, _passwordController.text ,_profilController.text).then((result) {
      if ('success' == result) {
        _getUsers(); // Refresh the list after update
        setState(() {
          _isUpdating = false;
        });
        _clearValues();
      }
    });
  }

  _deleteUser(User user) {
    _showProgress('Deleting User...');
    Services.deleteUser(user.id_user.toString()).then((result) {
      if ('success' == result) {
        _getUsers(); // Refresh after delete...
      }
    });
  }

  // Method to clear TextField values
  _clearValues() {
    _nomController.text = '';
    _prenomController.text = '';
    _emailController.text = '';
    _passwordController.text = '';
    _profilController.text = '';
  }

  _showValues(User user) {
    _nomController.text = user.nom;
    _prenomController.text = user.prenom;
    _emailController.text = user.email;
    _passwordController.text = user.password;
    _profilController.text = user.profil;
  }

  // Let's create a DataTable and show the user list in it.
  SingleChildScrollView _dataBody() {
    // Both Vertical and Horozontal Scrollview for the DataTable to
    // scroll both Vertical and Horizontal...
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(
              label: Text('ID USER'),
            ),
            DataColumn(
              label: Text('NOM'),
            ),
            DataColumn(
              label: Text('PRENOM'),
            ),
            DataColumn(
              label: Text('EMAIL'),
            ),
            DataColumn(
              label: Text('PASSWORD'),
            ),
            DataColumn(
              label: Text('PROFIL'),
            ),
            // Lets add one more column to show a delete button
            DataColumn(
              label: Text('DELETE'),
            )
          ],
          rows: _users
              .map(
                (user) => DataRow(cells: [
              DataCell(
                Text(user.id_user),
                // Add tap in the row and populate the
                // textfields with the corresponding values to update
                onTap: () {
                  _showValues(user);
                  // Set the Selected employee to Update
                  _selectedUser = user;
                  setState(() {
                    _isUpdating = true;
                  });
                },
              ),
              DataCell(
                Text(
                  user.nom.toUpperCase(),
                ),
                onTap: () {
                  _showValues(user);
                  // Set the Selected employee to Update
                  _selectedUser = user;
                  // Set flag updating to true to indicate in Update Mode
                  setState(() {
                    _isUpdating = true;
                  });
                },
              ),
              DataCell(
                Text(
                  user.prenom.toUpperCase(),
                ),
                onTap: () {
                  _showValues(user);
                  // Set the Selected employee to Update
                  _selectedUser = user;
                  setState(() {
                    _isUpdating = true;
                  });
                },
              ),
                  DataCell(
                    Text(
                      user.email.toUpperCase(),
                    ),
                    onTap: () {
                      _showValues(user);
                      // Set the Selected employee to Update
                      _selectedUser = user;
                      setState(() {
                        _isUpdating = true;
                      });
                    },
                  ),
                  DataCell(
                    Text(
                      user.password.toUpperCase(),
                    ),
                    onTap: () {
                      _showValues(user);
                      // Set the Selected employee to Update
                      _selectedUser = user;
                      setState(() {
                        _isUpdating = true;
                      });
                    },
                  ),
                  DataCell(
                    Text(
                      user.profil.toUpperCase(),
                    ),
                    onTap: () {
                      _showValues(user);
                      // Set the Selected employee to Update
                      _selectedUser = user;
                      setState(() {
                        _isUpdating = true;
                      });
                    },
                  ),
              DataCell(IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  _deleteUser(user);
                },
              ))
            ]),
          )
              .toList(),
        ),
      ),
    );
  }

  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(_titleProgress), // we show the progress in the title...
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _createTable();
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _getUsers();
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _nomController,
                decoration: InputDecoration.collapsed(
                  hintText: 'NOM',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _prenomController,
                decoration: InputDecoration.collapsed(
                  hintText: 'PRENOM',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration.collapsed(
                  hintText: 'EMAIL',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration.collapsed(
                  hintText: 'PASSWORD',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _profilController,
                decoration: InputDecoration.collapsed(
                  hintText: 'PROFIL',
                ),
              ),
            ),
            // Add an update button and a Cancel Button
            // show these buttons only when updating an employee
            _isUpdating
                ? Row(
              children: <Widget>[
                OutlineButton(
                  child: Text('UPDATE'),
                  onPressed: () {
                    _updateUser(_selectedUser);
                  },
                ),
                OutlineButton(
                  child: Text('CANCEL'),
                  onPressed: () {
                    setState(() {
                      _isUpdating = false;
                    });
                    _clearValues();
                  },
                ),
              ],
            )
                : Container(),
            Expanded(
              child: _dataBody(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addUser();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
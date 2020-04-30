
import 'dart:convert';

import 'package:http/http.dart'
as http;

import '../Model/User.dart'; // add the http plugin in pubspec.yaml file.
class Services {
  static const ROOT = 'http://192.168.1.5/Test/UserDB.php';
  static const ROOT1 = 'http://192.168.1.5/Test/Get/User.php';
  static const _get = 'get';
  static const _CREATE_TABLE_ACTION = 'CREATE_TABLE';
  static const _GET_ALL_ACTION = 'GET_ALL';
  static const _ADD_USER_ACTION = 'ADD_USER';
  static const _UPDATE_USER_ACTION = 'UPDATE_USER';
  static const _DELETE_USER_ACTION = 'DELETE_USER';
  static const _GET_ONE_ACTION = 'g';

  // Method to create the table Employees.
  static Future<String> createTable() async {
    try {
      // add the parameters to pass to the request.
      var map = Map<String, dynamic>();
      map['action'] = _CREATE_TABLE_ACTION;
      final response = await http.post(ROOT, body: map);
      print('Create Table Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }




  //login user
  /*static Future<List> login(String email, String password) async {
    var map = Map<String, dynamic>();
    map['action'] = _LOGIN_USER_ACTION;
    map['email'] = email;
    map['password'] = password;
    final response = await http.post(ROOT, body: map);

    /*if(datauser[0]['profil']=='user'){
      Navigator.pushReplacementNamed(context, '/AdminPage');
    }*/
    List list = parseResponse(response.body);
    return list;

    }*/


  /*static Future<List<User>> getUsers() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      final response = await http.post(ROOT, body: map);
      print('getUsers Response: ${response.body}');
      if (200 == response.statusCode) {
        List<User> list = parseResponse(response.body);
        return list;
      } else {
        return List<User>();
      }
    } catch (e) {
      return List<User>(); // return an empty list on exception/error
    }
  }*/


  static Future<List<User>> getOneUser(String email) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ONE_ACTION;
      map['email'] = email;
      final response = await http.post(ROOT1, body: map);
      print('getOneUser Response: ${response.body}');
      if (200 == response.statusCode) {
        List<User> list = parseResponse(response.body);
        return list;
      } else {
        return List<User>();
      }
    } catch (e) {
      return List<User>();

     //  return an empty list on exceptionerror
      print('error getOneUser la liste est vide ');
    }
  }

  static List<User> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }

  // Method to add employee to the database...
  static Future<String> addUser(String nom, String prenom,String email,String password,String profil) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _ADD_USER_ACTION;
      map['nom'] = nom;
      map['prenom'] = prenom;
      map['email'] = email;
      map['password'] = password;
      map['profil'] = profil;
      final response = await http.post(ROOT, body: map);
      print('addUser Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  // Method to update an Employee in Database...
  //id_user String not int ``````````````````````````````````````???????????????
  static Future<String> updateUser(String id_user, String nom, String prenom, String email, String password, String profil) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _UPDATE_USER_ACTION;
      map['id_user'] = id_user;
      map['nom'] = nom;
      map['prenom'] = prenom;
      map['email'] = email;
      map['password'] = password;
      map['profil'] = profil;
      final response = await http.post(ROOT, body: map);
      print(" la reponse est : $response le nv nom = $nom");
      print('updateUser Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  // Method to Delete an Employee from Database...
  // id_user string not int ??????????????????????????????????????????????????/
  static Future<String> deleteUser(String id_user) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _DELETE_USER_ACTION;
      map['id_user'] = id_user;
      final response = await http.post(ROOT, body: map);
      print('deleteEmployee Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error"; // returning just an "error" string to keep this simple...
    }
  }
}
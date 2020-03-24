import 'dart:convert';
import 'package:http/http.dart'
as http; // add the http plugin in pubspec.yaml file.
import 'User.dart';

class Services {
  static const ROOT = 'http://192.168.43.142/Test/UserDB.php';
  static const _CREATE_TABLE_ACTION = 'CREATE_TABLE';
  static const _GET_ALL_ACTION = 'GET_ALL';
  static const _ADD_USER_ACTION = 'ADD_USER';
  static const _UPDATE_USER_ACTION = 'UPDATE_USER';
  static const _DELETE_USER_ACTION = 'DELETE_USER';

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

  static Future<List<User>> getUsers() async {
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
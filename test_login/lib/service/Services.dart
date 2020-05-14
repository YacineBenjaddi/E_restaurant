import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/User.dart';

class Services {
  static const ROOT = 'http://192.168.1.5/Test/UserDB.php';
  static const ROOT1 = 'http://192.168.1.5/Test/Get/User.php';
  static const _get = 'get';
  static const _CREATE_TABLE_ACTION = 'CREATE_TABLE';
  static const _GET_ALL_ACTION = 'GET_ALL';
  static const _ADD_USER_ACTION = 'ADD_USER';
  static const _UPDATE_USER_ACTION = 'UPDATE_USER';
  static const _DELETE_USER_ACTION = 'DELETE_USER';
  static const _UPDATE_RESET = 'UPDATE_REST';
  static const _GET_ONE_ACTION = 'g';

  static List<User> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }

  static Future<String> addUser(String last_name, String first_name,
      String email, String password, String profile) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _ADD_USER_ACTION;
      map['last_name'] = last_name;
      map['first_name'] = first_name;
      map['email'] = email;
      map['password'] = password;
      map['profile'] = profile;
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

  static Future<String> updateUser(String id_user, String last_name,
      String first_name, String email, String password, String profile) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _UPDATE_USER_ACTION;
      map['id_user'] = id_user;
      map['last_name'] = last_name;
      map['first_name'] = first_name;
      map['email'] = email;
      map['password'] = password;
      map['profile'] = profile;
      final response = await http.post(ROOT, body: map);
      print(" la reponse est : $response le nv nom = $last_name");
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

  static Future<String> updateReset(String email) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _UPDATE_RESET;
      map['email'] = email;

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

  static Future<String> deleteUser(String id_user) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _DELETE_USER_ACTION;
      map['id_user'] = id_user;
      final response = await http.post(ROOT, body: map);
      print('delete User Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
}

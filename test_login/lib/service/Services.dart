import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lastapp/service/ApiUrl.dart';

import '../models/User.dart';

class Services {


  static List<User> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }

  static Future<String> addUser(String last_name, String first_name,
      String email, String password, String profile) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = ApiUrl.ADD_USER_ACTION;
      map['last_name'] = last_name;
      map['first_name'] = first_name;
      map['email'] = email;
      map['password'] = password;
      map['profile'] = profile;
      final response = await http.post(ApiUrl.UserDB, body: map);
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
      map['action'] = ApiUrl.UPDATE_USER_ACTION;
      map['id_user'] = id_user;
      map['last_name'] = last_name;
      map['first_name'] = first_name;
      map['email'] = email;
      map['password'] = password;
      map['profile'] = profile;
      final response = await http.post(ApiUrl.UserDB, body: map);
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
      map['action'] = ApiUrl.UPDATE_RESET;
      map['email'] = email;

      final response = await http.post(ApiUrl.UserDB, body: map);
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
      map['action'] = ApiUrl.DELETE_USER_ACTION;
      map['id_user'] = id_user;
      final response = await http.post(ApiUrl.UserDB, body: map);
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

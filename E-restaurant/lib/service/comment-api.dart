import 'ApiUrl.dart';
import '../models/comment.dart';
import 'package:http/http.dart' as http;
 //String id_restaurant="3";
Future<List<Comments>> fetchComments(String id_restaurant) async {
 // String url = "http://192.168.1.4/Test/comments.php";
  final response = await http.post(ApiUrl.get, body: {
    "id_restaurant": id_restaurant,

  });
 // print("requeeeeeeeeeeeeeeeet ${response.body} +++++++++++ $id_restaurant");
  return commentsFromJson(response.body);

}
Future<String> addComment(String title, String texto,
String name, String rating, String id_restaurant) async {
try {
var map = Map<String, dynamic>();
map['action'] = ApiUrl.ADD_COMMENT_ACTION;
map['title'] = title;
map['texto'] = texto;
map['name'] = name;
map['rating'] =rating;
map['id_restaurant'] = id_restaurant;
final response = await http.post(ApiUrl.add, body: map);
print('addComment Response: ${response.body}');
if (200 == response.statusCode) {
return response.body;
} else {
return "error";
}
} catch (e) {
return "error";
}
}
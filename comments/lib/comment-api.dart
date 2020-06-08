import 'comment.dart';
import 'package:http/http.dart' as http;

Future<List<Comments>> fetchComments() async {
  String url = "http://192.168.1.103/comments/comments.php";
  final response = await http.get(url);
  return commentsFromJson(response.body);
}

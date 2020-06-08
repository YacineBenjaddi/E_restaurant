import 'dart:convert';

List<Comments> commentsFromJson(String str) => List<Comments>.from(json.decode(str).map((x) => Comments.fromMap(x)));

String commentsToJson(List<Comments> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comments {
  String id;
  String title;
  String text;
  String name;
  String rating;

  Comments({
    this.id,
    this.title,
    this.text,
    this.name,
    this.rating,
  });

  factory Comments.fromMap(Map<String, dynamic> json) => Comments(
    id: json["id"],
    title: json["title"],
    text: json["text"],
    name: json["name"],
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "text": text,
    "name": name,
    "rating": rating,
  };
}

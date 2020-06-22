class Quote {
  final String quote;
  String personName;
  String imageURL;

  Quote(this.quote, {this.personName, this.imageURL});
}

List<Quote> quotes = [
  new Quote("Restaurant.", personName: "search", imageURL: "assets/images/restaurant.jpg"),
  new Quote("Cinema.", personName: "search", imageURL: "assets/images/cinema.jpg"),
  new Quote("Library.", personName: "search", imageURL: "assets/images/library.jpg")
];
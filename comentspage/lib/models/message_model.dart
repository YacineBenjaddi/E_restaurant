import 'package:comentspage/models/user_model.dart';

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'assets/images/greg.jpg',
);

// USERS
final User AddikRestaurant = User(
  id: 1,
  name: 'Addik',
  imageUrl: 'assets/images/addik.png',
);
final User Dominos = User(
  id: 2,
  name: 'Dominos',
  imageUrl: 'assets/images/dominos.png',
);
final User Picolos = User(
  id: 3,
  name: 'Picolos',
  imageUrl: 'assets/images/supper_1.jpeg',
);

// FAVORITE CONTACTS
List<User> favorites = [AddikRestaurant, Dominos, Picolos];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [

  Message(
    sender: AddikRestaurant,
    time: '2:30 PM',
    text: 'Trés bon coin, venez nombreux',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: Dominos,
    time: '1:30 PM',
    text: 'offre spéciale',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: Picolos,
    time: '12:30 PM',
    text: 'Soft & classy',
    isLiked: false,
    unread: false,
  ),

];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: AddikRestaurant,
    time: '5:30 PM',
    text: 'des offres spéciales allant jusquà 20% de remises',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Je recommande',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: AddikRestaurant,
    time: '3:45 PM',
    text: 'Vous etes les bienvenus',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: AddikRestaurant,
    time: '3:15 PM',
    text: 'Best chicken seller',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Fantastique',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: AddikRestaurant,
    time: '2:00 PM',
    text: 'il yen a pour tout les gouts',
    isLiked: false,
    unread: true,
  ),
];

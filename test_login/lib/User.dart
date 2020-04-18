class User{

  String id_user, nom,prenom,email,password,profil;

  User({this.id_user,this.nom,this.prenom,this.email,this.password,this.profil});

  factory User.fromJson(Map<String, dynamic> json){
   return User(
   id_user: json['id_user'] as String,
   nom : json['nom'] as String,
   prenom : json['prenom'] as String,
    email : json['email'] as String,
     password: json['password'] as String,
     profil : json['profil'] as String,

   );
   }
  }

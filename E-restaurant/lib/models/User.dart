class User {
  String id_user, last_name, first_name, email, password, profile;

  User(
      {this.id_user,
        this.last_name,
        this.first_name,
        this.email,
        this.password,
        this.profile});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id_user: json['id_user'] as String,
      last_name: json['last_name'] as String,
      first_name: json['first_name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      profile: json['profile'] as String,
    );
  }
}

class UserModel {
  final String token;

  UserModel({required this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(token: json['token']);
  }
}

class User {
  final String name;
  final String email;
  final String voterid;
  final String image;

  User(
      {required this.name,
      required this.email,
      required this.voterid,
      required this.image});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'],
        email: json['email'],
        voterid: json['voter_id'],
        image: json['image']);
  }
}

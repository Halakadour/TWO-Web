class UserModel {
  final String token;
  final String name;
  final String email;

  const UserModel({
    required this.token,
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        token: json["token"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "name": name,
        "email": email,
      };
}

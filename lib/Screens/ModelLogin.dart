class ModelLogin {
  final String username;
  final String password;

  ModelLogin({this.username, this.password});

  factory ModelLogin.fromJson(Map<String, dynamic> json) {
    return ModelLogin(
      username: json['username'],
      password: json['password'],
    );
  }
}
class LoginModel {
  final String msg;
  final String token;
  final String id;
  final String name;
  final String email;
  final String emailAdmin;

  LoginModel({
    required this.msg,
    required this.token,
    required this.id,
    required this.name,
    required this.email,
    required this.emailAdmin,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      msg: json['msg'],
      token: json['token'],
      id: json['data']['id'],
      name: json['data']['name'],
      email: json['data']['email'],
      emailAdmin: json['data']['email'] , 
    );
  }

}

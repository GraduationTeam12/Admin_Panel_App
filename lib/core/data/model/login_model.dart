import 'package:admin_panel_app/core/api/end_points.dart';

class LoginModel {
  final String msg;
  final String token;

  LoginModel({
    required this.msg,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> jsonData) {
    return LoginModel(
        msg: jsonData[ApiKeys.message], token: jsonData[ApiKeys.token]);
  }
}
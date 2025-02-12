class UpdateUserModel {
  final String status;
  final String msg;
  final String email;
  UpdateUserModel({
    required this.status,
    required this.msg,
    required this.email,
  });

  factory UpdateUserModel.fromJson(Map<String, dynamic> jsonData) {
    return UpdateUserModel(
        status: jsonData['status'],
        msg: jsonData['msg'],
        email: jsonData['data']['email']);
  }
}

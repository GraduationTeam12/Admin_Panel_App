class UpdateUserModel {
  final String status;
  final String msg;

  UpdateUserModel({
    required this.status,
    required this.msg,
  });

  factory UpdateUserModel.fromJson(Map<String, dynamic> jsonData) {
    return UpdateUserModel(status: jsonData['status'], msg: jsonData['msg']);
  }
}

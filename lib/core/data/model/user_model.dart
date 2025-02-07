class UserModel {
  final String username;
  final String email;
  final String phone;
  final int age;
  final String address;
  final String nationalId;
  final String boardId;
  final String? avatarUrl;

  UserModel({
    required this.username,
    required this.email,
    required this.phone,
    required this.age,
    required this.address,
    required this.nationalId,
    required this.boardId,
    required this.avatarUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      age: json['age'],
      address: json['address'],
      nationalId: json['nationalId'].toString(),
      boardId: json['boardId'],
      avatarUrl: json['avatarUrl'],
    );
  }
}

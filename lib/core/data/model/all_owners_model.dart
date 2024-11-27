class Users{

   final String id;
  final String username;
  final String email;
  final String phone;
  final String address;
  final String boardId;
  final int nationalId;

  Users({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.address,
    required this.boardId,
    required this.nationalId,
  });


  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      boardId: json['boardId'],
      nationalId: json['nationalId'],
    );
  }
}


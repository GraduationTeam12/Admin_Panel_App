class Users{

  final String id;
  final String? username;
  final String? email;
  final String? phone;
  final String? address;
  final String? boardId;
  final String? nationalId;
    final DateTime createdAt;


  Users({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.address,
    required this.boardId,
    required this.nationalId,
        required this.createdAt,

  });


  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['_id']??"",
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      boardId: json['boardId'],
      nationalId: json['nationalId'],
            createdAt: DateTime.parse(json['createdAt']),

    );
  }
}


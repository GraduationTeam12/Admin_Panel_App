class AllEmergenciesModel {
  final String id;
  final String type;
  final String name;
  final String email;
  final String phone;
  final String address;
  final int number;
  final double latitude;
  final double longitude;

  AllEmergenciesModel({
    required this.id,
    required this.type,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.number,
    required this.latitude,
    required this.longitude
  });


  factory AllEmergenciesModel.fromJson(Map<String, dynamic> json) {
    return AllEmergenciesModel(
      id: json['_id'],
      type: json['type'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      number: json['number'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
  
}
  
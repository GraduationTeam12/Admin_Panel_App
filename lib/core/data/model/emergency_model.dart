// ignore_for_file: public_member_api_docs, sort_constructors_first
class EmergencyModel {
  final String type;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String number;
  final String longitude;
  final String latitude;
  EmergencyModel({
    required this.type,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.number,
    required this.latitude,
    required this.longitude,
  });


  factory EmergencyModel.fromJson(Map<String, dynamic> json) {
    return EmergencyModel(
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

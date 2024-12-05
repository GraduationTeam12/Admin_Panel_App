// ignore_for_file: public_member_api_docs, sort_constructors_first
class ReportModel {
  final String name;
  final String email;
  final String id;
  final String? location;
  final String? board;
  final String? phone;
  final String? address;
  final String? longitude;
  final String? latitude;
  
  ReportModel({
    required this.name,
    required this.email,
    required this.id,
    this.location,
    this.board,
    this.phone,
    this.address,
    this.longitude,
    this.latitude,
  });
}

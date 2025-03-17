// ignore_for_file: public_member_api_docs, sort_constructors_first
class EmergencyAnalysisModel {
  final int hospitals;
  final int fireStations;
  final int cranes;
  EmergencyAnalysisModel({
    required this.hospitals,
    required this.fireStations,
    required this.cranes,
  });

  factory EmergencyAnalysisModel.fromJson(Map<String, dynamic> json) {
    return EmergencyAnalysisModel(
      hospitals: json['Hospitals'],
      fireStations: json['Fire_stations'],
      cranes: json['Cranes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Hospitals': hospitals,
      'Fire_stations': fireStations,
      'Cranes': cranes,
    };
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin_panel_app/core/data/model/analysis_model/emergency_model.dart';

class AnalysisModel {
  final int users;
  final int accidents;
  final EmergencyAnalysisModel emergencies;
  AnalysisModel({
    required this.users,
    required this.accidents,
    required this.emergencies,
  });

  factory AnalysisModel.fromJson(Map<String, dynamic> json) {
    return AnalysisModel(
      users: json['users'],
      accidents: json['accidents'],
      emergencies: EmergencyAnalysisModel.fromJson(json['emergencies']),
    );
  }

  
  Map<String, dynamic> toJson() {
    return {
      'users': users,
      'accidents': accidents,
      'emergencies': emergencies.toJson(),
    };
  }
}

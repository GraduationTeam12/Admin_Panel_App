class DailyUserModel {
  final String date; // "2025-07-01"
  final int count;

  DailyUserModel({required this.date, required this.count});

  factory DailyUserModel.fromJson(Map<String, dynamic> json) {
    return DailyUserModel(
      date: json['date'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'count': count,
    };
  }
}

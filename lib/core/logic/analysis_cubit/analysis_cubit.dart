import 'package:admin_panel_app/core/data/model/all_emergencies_model.dart';
import 'package:admin_panel_app/core/data/model/all_owners_model.dart';
import 'package:admin_panel_app/core/data/model/analysis_model/analysis_model.dart';
import 'package:admin_panel_app/core/data/model/analysis_model/daily_user_model.dart';
import 'package:admin_panel_app/core/data/model/emergency_model.dart';
import 'package:admin_panel_app/core/data/model/user_model.dart';
import 'package:admin_panel_app/core/data/repo/repo_implementation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:admin_panel_app/core/cache/cache_helper.dart';
part 'analysis_state.dart';

class AnalysisCubit extends Cubit<AnalysisState> {
  AnalysisCubit(this.repo) : super(AnalysisInitial());

  final RepositoryImplementation repo;

   Future<void> getAnalysis(String token) async {
  // ✅ 1. Load cached data if available
  final cached = CacheHelper().getData(key: 'cached_analysis');
  if (cached != null) {
    final cachedModel = AnalysisModel.fromJson(jsonDecode(cached));
    emit(AnalysisSuccess(cachedModel));
  }

  // ✅ 2. Get latest data from API
  final response = await repo.getAnalysis(token);

  response.fold(
    (l) => emit(AnalysisError(l)),
    (r) {
      // ✅ 3. Save the new data to cache
      CacheHelper().saveData(
        key: 'cached_analysis',
        value: jsonEncode(r.toJson()), // تأكد أن عندك toJson()
      );

      emit(AnalysisSuccess(r));
    },
  );
}
Future<List<AllEmergenciesModel>> getAllEmergencies(String token) async {
  final result = await repo.getAllEmergencies(token);
  return result.fold(
    (error) {
      print("Error in getAllEmergencies: $error");
      return [];
    },
    (data) => data,
  );
}


Future<List<DailyUserModel>> fetchDailyUsers(String token) async {
  final response = await repo.getAllOwners(token);

  return response.fold(
    (error) {
      print("Error: $error");
      return [];
    },
    (users) => getDailyCounts(users),
  );
}

List<DailyUserModel> getDailyCounts(List<Users> users) {
  Map<String, int> counts = {};

  for (var user in users) {
    final date = "${user.createdAt.year}-${user.createdAt.month.toString().padLeft(2, '0')}-${user.createdAt.day.toString().padLeft(2, '0')}";
    counts[date] = (counts[date] ?? 0) + 1;
  }

  return counts.entries
      .map((e) => DailyUserModel(date: e.key, count: e.value))
      .toList();
}

Map<int, int> getMonthlyUserCounts(List<DailyUserModel> dailyUsers) {
  final currentYear = DateTime.now().year;
  Map<int, int> monthlyCounts = { for (var i = 1; i <= 12; i++) i: 0 };

  for (var user in dailyUsers) {
    final dateParts = user.date.split('-');
    final year = int.tryParse(dateParts[0]);
    final month = int.tryParse(dateParts[1]);

    if (year == currentYear && month != null) {
      monthlyCounts[month] = (monthlyCounts[month] ?? 0) + user.count;
    }
  }

  return monthlyCounts;
}
Map<String, int> getTotalEmergencyCountsThisYear(List<EmergencyModel> emergencies) {
  final currentYear = DateTime.now().year;

  Map<String, int> totalCounts = {
    'hospitals': 0,
    'firestations': 0,
    'cranes': 0,
  };

  for (var emergency in emergencies) {
    if (emergency.createdAt.year == currentYear) {
      final type = emergency.type.toLowerCase();
      if (totalCounts.containsKey(type)) {
        totalCounts[type] = totalCounts[type]! + 1;
      }
    }
  }

  return totalCounts;
}

Map<int, Map<String, int>> getMonthlyEmergencyCounts(List<EmergencyModel> emergencies) {
  final Map<int, Map<String, int>> monthlyCounts = {};

  for (var emergency in emergencies) {
    final month = emergency.createdAt.month;

    monthlyCounts.putIfAbsent(month, () => {
      'hospitals': 0,
      'firestations': 0,
      'cranes': 0,
    });

    final type = emergency.type.toLowerCase();

    if (monthlyCounts[month]!.containsKey(type)) {
      monthlyCounts[month]![type] = monthlyCounts[month]![type]! + 1;
    }
  }

  return monthlyCounts;
}



  // Future<void> getAnalysis(String token) async {
  //   emit(AnalysisLoading());

  //   final response = await repo.getAnalysis(token);

  //   response.fold(
  //       (l) => emit(AnalysisError(l)),
  //       (r) => emit(AnalysisSuccess(r)));
  // }
}

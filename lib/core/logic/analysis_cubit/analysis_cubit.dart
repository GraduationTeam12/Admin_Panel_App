import 'package:admin_panel_app/core/data/model/all_owners_model.dart';
import 'package:admin_panel_app/core/data/model/analysis_model/analysis_model.dart';
import 'package:admin_panel_app/core/data/model/analysis_model/daily_user_model.dart';
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

  // Future<void> getAnalysis(String token) async {
  //   emit(AnalysisLoading());

  //   final response = await repo.getAnalysis(token);

  //   response.fold(
  //       (l) => emit(AnalysisError(l)),
  //       (r) => emit(AnalysisSuccess(r)));
  // }
}

import 'package:admin_panel_app/core/data/model/analysis_model/analysis_model.dart';
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

  // Future<void> getAnalysis(String token) async {
  //   emit(AnalysisLoading());

  //   final response = await repo.getAnalysis(token);

  //   response.fold(
  //       (l) => emit(AnalysisError(l)),
  //       (r) => emit(AnalysisSuccess(r)));
  // }
}

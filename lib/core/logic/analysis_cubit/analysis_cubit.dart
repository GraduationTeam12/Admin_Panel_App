import 'package:admin_panel_app/core/data/model/analysis_model/analysis_model.dart';
import 'package:admin_panel_app/core/data/repo/repo_implementation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'analysis_state.dart';

class AnalysisCubit extends Cubit<AnalysisState> {
  AnalysisCubit(this.repo) : super(AnalysisInitial());

  final RepositoryImplementation repo;

  Future<void> getAnalysis(String token) async {
    emit(AnalysisLoading());

    final response = await repo.getAnalysis(token);

    response.fold(
        (l) => emit(AnalysisError(l)),
        (r) => emit(AnalysisSuccess(r)));
  }
}

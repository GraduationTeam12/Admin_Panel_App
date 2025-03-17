part of 'analysis_cubit.dart';

sealed class AnalysisState {}

final class AnalysisInitial extends AnalysisState {}

final class AnalysisLoading extends AnalysisState {}

final class AnalysisSuccess extends AnalysisState {
  final AnalysisModel analysisModel;
  AnalysisSuccess(this.analysisModel);
}

final class AnalysisError extends AnalysisState {
  final String errorMessage;
  AnalysisError(this.errorMessage);
}

import 'package:bloc/bloc.dart';

class NavigationCubit extends Cubit<int> {
  NavigationCubit() : super(0); // Default to the first page

  void navigateTo(int pageIndex) {
    emit(pageIndex);
  }

  @override
  int? fromJson(Map<String, dynamic> json) {
    return json['pageIndex'] as int?;
  }

  @override
  Map<String, dynamic>? toJson(int state) {
    return {'pageIndex': state};
  }
}

 

import 'package:admin_panel_app/core/api/end_points.dart';
import 'package:admin_panel_app/core/cache/cache_helper.dart';
import 'package:admin_panel_app/core/logic/logout_cubit/logout_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 
class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());



  Future<void> logout() async {
  await CacheHelper().removeData(key: ApiKeys.token);
  emit(LogoutSuccessState());
}

}

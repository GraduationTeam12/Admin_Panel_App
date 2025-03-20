 

import 'package:admin_panel_app/core/api/end_points.dart';
import 'package:admin_panel_app/core/cache/cache_helper.dart';
import 'package:admin_panel_app/core/logic/logout_cubit/logout_state.dart';
import 'package:admin_panel_app/routing/router_generator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 
class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());



  Future<void> logout() async {
  RouterGenerator.authNotifier.setToken(null);
  emit(LogoutSuccessState());
}

}

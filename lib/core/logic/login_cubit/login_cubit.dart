import 'package:admin_panel_app/core/api/end_points.dart';
import 'package:admin_panel_app/core/cache/cache_helper.dart';
import 'package:admin_panel_app/core/data/model/login_model.dart';
import 'package:admin_panel_app/core/data/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepository authRepo;
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInpassword = TextEditingController();
  GlobalKey<FormState> loginKey = GlobalKey();

  LoginModel? loginModel;

  void login() async {
    emit(LoginLoadingState());

    final result = await authRepo.login(
        email: signInEmail.text, password: signInpassword.text);

    result.fold((l) => emit(LoginErrorState(errMsg: l)),
     (r) async {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(r.token);
      await CacheHelper().saveData(key: ApiKeys.token, value: r.token);
      await CacheHelper()
          .saveData(key: ApiKeys.id, value: decodedToken[ApiKeys.id]);

      loginModel = r;
      emit(LoginSuccessState(message: r.msg));
    });
  }
}

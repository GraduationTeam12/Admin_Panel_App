import 'package:admin_panel_app/core/api/api_consumer.dart';
import 'package:admin_panel_app/core/api/end_points.dart';
import 'package:admin_panel_app/core/data/model/login_model.dart';
import 'package:admin_panel_app/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

class AuthRepository{
  final ApiConsumer apiConsumer;

  AuthRepository({required this.apiConsumer});

  Future<Either<String, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiConsumer.post(
        EndPoint.logIn,
        data: {ApiKeys.email: email, ApiKeys.password: password},
      );
      return Right(LoginModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

}
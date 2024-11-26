import 'package:admin_panel_app/core/api/api_consumer.dart';
import 'package:admin_panel_app/core/api/end_points.dart';
import 'package:admin_panel_app/core/data/model/login_model.dart';
import 'package:admin_panel_app/core/error/exceptions.dart';
import 'package:admin_panel_app/core/error/exceptions_response.dart';
import 'package:dartz/dartz.dart';

class AuthRepository {
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
    } on ServerExceptionResponse catch (error) {
      return Left(error.errorResponse.errorMessage);
    }catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> sendCode(String email, dynamic token) async {
    try {
      final response = await apiConsumer.post(
        EndPoint.sendOtp,
        data: {ApiKeys.email: email},
        headers: {'authorization': 'Bearer $token'},
      );
      return Right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> verifyCode(
      String email, String code, dynamic token) async {
    try {
      final response = await apiConsumer.post(
        EndPoint.verifyOtp,
        data: {ApiKeys.email: email, ApiKeys.code: code},
        headers: {'authorization': 'Bearer $token'},
      );
      return Right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> getUserData(
    String email,
    String username,
    String phone,
    int age,
    String address,
    int nationalId,
    String boardId,
    String token,
  ) async {
    try {
      final response = await apiConsumer.post(
        EndPoint.userData,
        data: {
          ApiKeys.email: email,
          ApiKeys.username: username,
          ApiKeys.phone: phone,
          ApiKeys.age: age,
          ApiKeys.address: address,
          ApiKeys.nationalId: nationalId,
          ApiKeys.boardId: boardId
        },
        headers: {'authorization': 'Bearer $token'},
      );
      return Right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } on ServerExceptionResponse catch (error) {
      return Left(error.errorResponse.errorMessage);
    }catch (e) {
      return Left(e.toString());
    }
  }
}

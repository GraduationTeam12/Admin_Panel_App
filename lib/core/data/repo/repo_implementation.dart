import 'dart:convert';

import 'package:admin_panel_app/core/api/api_consumer.dart';
import 'package:admin_panel_app/core/api/end_points.dart';
import 'package:admin_panel_app/core/data/model/all_emergencies_model.dart';
import 'package:admin_panel_app/core/data/model/all_owners_model.dart';
import 'package:admin_panel_app/core/data/model/analysis_model/analysis_model.dart';
import 'package:admin_panel_app/core/data/model/emergency_model.dart';
import 'package:admin_panel_app/core/data/model/login_model.dart';
import 'package:admin_panel_app/core/data/model/update_user_model.dart';
import 'package:admin_panel_app/core/data/model/user_model.dart';
import 'package:admin_panel_app/core/error/exceptions.dart';
import 'package:admin_panel_app/core/error/exceptions_response.dart';
import 'package:dartz/dartz.dart';

class RepositoryImplementation {
  final ApiConsumer apiConsumer;

  RepositoryImplementation({required this.apiConsumer});

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
    } catch (e) {
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

  Future<Either<String, String>> sendUserData(
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
       if (response.containsKey('errors')) {
      return Left(jsonEncode(response['errors'])); 
    }
      return Right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } on ServerExceptionResponse catch (error) {
      return Left(error.errorResponse.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<Users>>> getAllOwners(dynamic token) async {
    try {
      final response = await apiConsumer.get(
        EndPoint.users,
        headers: {'Authorization': 'Bearer $token'},
      );

      final List<Users> users = (response['data'] as List)
          .map((user) => Users.fromJson(user))
          .toList();
      return Right(users);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<UserModel>>> getUser(
    String id,
    dynamic token,
  ) async {
    try {
      final response = await apiConsumer.get(
        EndPoint.getUser(id),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response['data'] is List) {
        final List<UserModel> users = (response['data'] as List)
            .map((userJson) => UserModel.fromJson(userJson))
            .toList();
        return Right(users);
      } else {
        return Left('Invalid data format: ${response['data']}');
      }
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left('Unexpected error: ${e.toString()}');
    }
  }

  Future<Either<String, UpdateUserModel>> updateUser(
    Map<String, dynamic> updatedData,
    String id,
    dynamic token,
  ) async {
    try {
      final response = await apiConsumer.put(
        EndPoint.updateUser(id),
        data: updatedData,
        headers: {'Authorization': 'Bearer $token'},
      );

      return Right(UpdateUserModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> verifyUpdatedEmail(
      String email, String code, String id, dynamic token) async {
    try {
      final response = await apiConsumer.post(
        EndPoint.verifyUpdatedEmailUser(id),
        data: {'email': email, ApiKeys.code: code},
        headers: {'Authorization': 'Bearer $token'},
      );
      return Right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> deleteUser(String id, dynamic token) async {
    try {
      final response = await apiConsumer.delete(
        EndPoint.deleteUser(id),
        headers: {'Authorization': 'Bearer $token'},
      );
      return Right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> addHospital(
      String type,
      String name,
      String phone,
      String address,
      String number,
      String latitude,
      String longitude,
      String password,
      String email,
      dynamic token) async {
    try {
      final response = await apiConsumer.post(
        EndPoint.addHospital,
        data: {
          'type': type,
          'name': name,
          'email': email,
          'phone': phone,
          'address': address,
          'number': number,
          "location": {
            "type": "Point",
            "coordinates": [latitude, longitude]
          },
          'password': password,
        },
        headers: {'Authorization': 'Bearer $token'},
      );
      return Right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<AllEmergenciesModel>>> getAllEmergencies(
      dynamic token) async {
    try {
      final response = await apiConsumer.get(
        EndPoint.getAllEmergencies,
        headers: {'Authorization': 'Bearer $token'},
      );

      final List<AllEmergenciesModel> emergencies = (response['data'] as List)
          .map((emergency) => AllEmergenciesModel.fromJson(emergency))
          .toList();
      return Right(emergencies);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } on ServerExceptionResponse catch (error) {
      return Left(error.errorResponse.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<EmergencyModel>>> getEmergency(
    String id,
    dynamic token,
  ) async {
    try {
      final response = await apiConsumer.get(
        EndPoint.getEmergency(id),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response['data'] is List) {
        final List<EmergencyModel> emegency = (response['data'] as List)
            .map((emergencyJson) => EmergencyModel.fromJson(emergencyJson))
            .toList();
        return Right(emegency);
      } else {
        return Left('Invalid data format: ${response['data']}');
      }
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left('Unexpected error: ${e.toString()}');
    }
  }

  Future<Either<String, String>> deleteEmergency(
      String id, dynamic token) async {
    try {
      final response = await apiConsumer.delete(
        EndPoint.deleteEmergency(id),
        headers: {'Authorization': 'Bearer $token'},
      );
      return Right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> updateEmergency(
    Map<String, dynamic> updatedData,
    String id,
    dynamic token,
  ) async {
    try {
      final response = await apiConsumer.put(
        EndPoint.deleteEmergency(id),
        data: updatedData,
        headers: {'Authorization': 'Bearer $token'},
      );

      return Right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, AnalysisModel>> getAnalysis(String token) async {
    try {
      final response = await apiConsumer.get(
        EndPoint.analysis,
        headers: {'Authorization': 'Bearer $token'},
      );
      return Right(AnalysisModel.fromJson(response));
    } catch (e) {
      return Left(e.toString());
    }
  }
}

import 'package:admin_panel_app/core/error/error_model.dart';
import 'package:admin_panel_app/core/error/exceptions.dart';
import 'package:dio/dio.dart';
import '../error/exceptions_response.dart';
import 'api_consumer.dart';
import 'api_interceptors.dart';
import 'end_points.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoint.baseUrl;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }
  @override
  Future delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    
  }) async {
    try {
      var options = Options(headers: headers);
      var res = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      var options = Options(headers: headers);
      var res = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      var options = Options(headers: headers);
      var res = await dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future put(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      var options = Options(headers: headers);
      var res = await dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      var options = Options(headers: headers);
      var res = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  handleDioException(e) {
    switch (e.type) {
      case DioExceptionType.badCertificate:
        throw BadCertificateException(ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.connectionTimeout:
        throw ConnectionTimeoutException(ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
      case DioExceptionType.sendTimeout:
        throw ServerException(ErrorModel.fromJson(e.response!.data));

      case DioExceptionType.badResponse:
        switch (e.response?.statusCode) {
          case 400: //bad request
            throw BadRequestExceptionResponse(ErrorResponse.fromJson(e.response!.data));

          case 401: //unauthorized
            throw UnauthorizedException(ErrorModel.fromJson(e.response!.data));

          case 403: //forbidden
            throw ForbiddenException(ErrorModel.fromJson(e.response!.data));

          case 404: //notFound
            throw NotFoundException(ErrorModel.fromJson(e.response!.data));

          case 409: //conflict
            throw ServerException(ErrorModel.fromJson(e.response!.data));

          case 504:
            throw BadRequestException(ErrorModel.fromJson(e.response!.data));

          // print(e.response);
        }
      case DioExceptionType.cancel:
        throw CancleExeption(ErrorModel.fromJson(e.response!.data));

      case DioExceptionType.unknown:
        throw ServerException(ErrorModel.fromJson(e.response!.data));

      // throw ServerException('badResponse');
    }
  }
}

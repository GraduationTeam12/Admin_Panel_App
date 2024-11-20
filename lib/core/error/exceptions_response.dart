import 'error_model.dart';

class ServerExceptionResponse implements Exception {
  final ErrorResponse errorResponse;

  ServerExceptionResponse(this.errorResponse);
}

class BadCertificateExceptionResponse extends ServerExceptionResponse {
  BadCertificateExceptionResponse(super.errorResponse);
}

class BadResposneExceptionResponse extends ServerExceptionResponse {
  BadResposneExceptionResponse(super.errorResponse);
}

class ConnectionTimeoutExceptionResponse extends ServerExceptionResponse {
  ConnectionTimeoutExceptionResponse(super.errorResponse);
}

class FetchDataExceptionResponse extends ServerExceptionResponse {
  FetchDataExceptionResponse(super.errorResponse);
}

class BadRequestExceptionResponse extends ServerExceptionResponse {
  BadRequestExceptionResponse(super.errorResponse);
}

class UnauthorizedExceptionResponse extends ServerExceptionResponse {
  UnauthorizedExceptionResponse(super.errorResponse);
}
class ForbiddenExceptionResponse extends ServerExceptionResponse {
  ForbiddenExceptionResponse(super.errorResponse);
}

class NotFoundExceptionResponse extends ServerExceptionResponse {
  NotFoundExceptionResponse(super.errorResponse);
}

class ConflictExceptionResponse extends ServerExceptionResponse {
  ConflictExceptionResponse(super.errorResponse);
}
class CancleExeptionResponse extends ServerExceptionResponse {
  CancleExeptionResponse(super.errorResponse);
}

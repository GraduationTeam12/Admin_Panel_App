class ErrorModel{
  // final int status;
  final String errorMessage;

  ErrorModel({
    // required this.status,
     required this.errorMessage});
  factory ErrorModel.fromJson(Map jsonData) {
    return ErrorModel(
      // status: jsonData['status'],
      errorMessage: jsonData['msg'],
    );
  }
}

class ErrorResponse {
  final String errorMessage;

  ErrorResponse({required this.errorMessage});

  
  factory ErrorResponse.fromJson(Map<String, dynamic> jsonData) {
     
    var errorsList = (jsonData['errors'] as List)
        .map((error) => ErrorModel.fromJson(error))
        .toList();

    return ErrorResponse(errorMessage: errorsList[0].errorMessage);
  }
}

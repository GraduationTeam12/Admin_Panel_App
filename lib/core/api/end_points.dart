class EndPoint {
  static const String baseUrl = 'https://satars.onrender.com/';
  static const String logIn = 'api/v1/dashboard/admins/login';
  static const String sendOtp = 'api/v1/dashboard/users/sendOtp';
  static const String verifyOtp = 'api/v1/dashboard/users/verifyOtp';
  static const String userData = 'api/v1/dashboard/users';
  static const String users = 'api/v1/dashboard/users';
  static const String user = 'api/v1/dashboard/users/';
  static const String verifiedEmail = 'api/v1/dashboard/users/verifyUpdate/';
  static const String addHospital = 'api/v1/dashboard/emergencies/modifyData';
  static const String getAllEmergencies = 'api/v1/dashboard/emergencies/';
  static const String getSpecificEmergency = 'api/v1/dashboard/emergencies/';
  static const String deleteEmergencyy = 'api/v1/dashboard/emergencies/';

  static String getUser(id) {
    return "$user$id";
  }

  static String updateUser(id) {
    return "$user$id";
  }

  static String verifyUpdatedEmailUser(id) {
    return "$verifiedEmail$id";
  }

  static String deleteUser(id) {
    return "$user$id";
  }

  static String getEmergency(id) {
    return "$getSpecificEmergency$id";
  }

  static String deleteEmergency(id) {
    return "$deleteEmergencyy$id";
  }
}

class ApiKeys {
  static const String id = 'id';
  static const String email = 'email';
  static const String password = 'password';
  static const String confirmPassword = 'passwordConfirm';
  static const String username = 'username';
  static const String phone = 'phone';
  static const String age = 'age';
  static const String address = 'address';
  static const String nationalId = 'nationalId';
  static const String boardId = 'boardId';
  static const String code = 'code';
  static const String message = 'msg';
  static const String token = 'token';
}

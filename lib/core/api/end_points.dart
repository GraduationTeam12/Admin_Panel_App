class EndPoint {
  static const String baseUrl = 'https://satars.onrender.com/';
  static const String logIn = 'admins/login';
  static const String sendOtp = 'admins/userSendOtp';
  static const String verifyOtp = 'admins/userVerfiyOtp';
  static const String userData = 'admins/userData';
  static const String users = 'admins/users';
  static const String user = 'admins/user/';
  static const String verifiedEmail = 'admins/verfiedUpdate/';
  static const String addHospital = 'adminsEmergency/emergencySignup';
  static const String getAllEmergencies = 'adminsEmergency/emergency';
  static const String getSpecificEmergency = 'adminsEmergency/emergency/';
  static const String deleteEmergencyy = 'adminsEmergency/emergency/';

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

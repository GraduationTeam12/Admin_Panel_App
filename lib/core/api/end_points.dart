class EndPoint {
  static const String baseUrl = 'https://satars.onrender.com/admins/';
  static const String logIn = 'login';
  static const String sendOtp = 'userSendOtp';
  static const String verifyOtp = 'userVerfiyOtp';
  static const String userData = 'userData';
  static const String users = 'users';
  static const String user = 'user/';
  static const String verifiedEmail = 'verfiedUpdate/';

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

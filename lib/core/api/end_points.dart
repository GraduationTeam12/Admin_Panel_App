class EndPoint {
  static const String baseUrl = 'http://192.168.1.48:3000/users/';
  static const String logIn = 'login';
  static const String forgotPassword = 'forgotPass';
  static const String sendCode = 'verifyOtp';
  static const String changeForgottenPassword =
      'resetPassword';
 

   
}

class ApiKeys {
  static const String id = 'id';
  static const String email = 'email';
  static const String password = 'password';
  static const String confirmPassword = 'passwordConfirm';
  static const String code = 'otp';
  static const String message = 'message';
  static const String token = 'token';
}

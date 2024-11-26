 
sealed class AddOwnerState {}

final class AddOwnerInitial extends AddOwnerState {}

final class SendCodeLoading extends AddOwnerState {}

final class SendCodeSucess extends AddOwnerState {
  final String message;

  SendCodeSucess(this.message);
}

final class SendCodeError extends AddOwnerState {
  final String errMessage;

  SendCodeError(this.errMessage);
}

final class VerifyCodeLoading extends AddOwnerState {}

final class VerifyCodeSuccess extends AddOwnerState {
  final String message;

  VerifyCodeSuccess(this.message);
}

final class VerifyCodeError extends AddOwnerState {
  final String errMessage;

  VerifyCodeError(this.errMessage);
}

final class AddUserLoading extends AddOwnerState {}

final class AddUserSuccess extends AddOwnerState {
  final String message;

  AddUserSuccess(this.message);
}

final class AddUserError extends AddOwnerState {
  final String errMessage;

  AddUserError(this.errMessage);
}


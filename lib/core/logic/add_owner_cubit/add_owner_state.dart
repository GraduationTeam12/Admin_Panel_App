 
import 'package:admin_panel_app/core/data/model/all_owners_model.dart';
import 'package:admin_panel_app/core/data/model/user_model.dart';

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

final class GetAllOwnerLoading extends AddOwnerState {}

final class GetAllOwnerSuccess extends AddOwnerState {
  final List<Users> users;

  GetAllOwnerSuccess(this.users );
}

final class GetAllOwnerError extends AddOwnerState {
  final String errMessage;

  GetAllOwnerError(this.errMessage);
}

final class GetUserLoading extends AddOwnerState {}

final class GetUserSuccess extends AddOwnerState {
  final List<UserModel> user;

  GetUserSuccess(this.user );
}

final class GetUserError extends AddOwnerState {
  final String errMessage;

  GetUserError(this.errMessage);
}

final class UpdateUserLoading extends AddOwnerState {}

final class UpdateUserSuccess extends AddOwnerState {
  final String message;

  UpdateUserSuccess(this.message );
}

final class UpdateUserEmailPending extends AddOwnerState {
  final String message;

  UpdateUserEmailPending(this.message );
}

final class UpdateUserError extends AddOwnerState {
  final String errMessage;

  UpdateUserError(this.errMessage);
}



final class VerifyUpdatedEmailUserLoading extends AddOwnerState {}

final class VerifyUpdatedEmailUserSuccess extends AddOwnerState {
  final String message;

  VerifyUpdatedEmailUserSuccess(this.message );
}

final class VerifyUpdatedEmailUserError extends AddOwnerState {
  final String errMessage;

  VerifyUpdatedEmailUserError(this.errMessage);
}



final class DeleteUserLoading extends AddOwnerState {}

final class  DeleteUserSuccess extends AddOwnerState {
  final String message;

   DeleteUserSuccess(this.message );
}

final class  DeleteUserError extends AddOwnerState {
  final String errMessage;

   DeleteUserError(this.errMessage);
}



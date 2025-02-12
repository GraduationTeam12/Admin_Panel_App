import 'package:admin_panel_app/core/data/model/all_emergencies_model.dart';
import 'package:admin_panel_app/core/data/model/all_owners_model.dart';
import 'package:admin_panel_app/core/data/model/emergency_model.dart';
import 'package:admin_panel_app/core/data/model/user_model.dart';

sealed class AddOwnerAndHospitalState {}

final class AddOwnerInitial extends AddOwnerAndHospitalState {}

final class SendCodeLoading extends AddOwnerAndHospitalState {}

final class SendCodeSucess extends AddOwnerAndHospitalState {
  final String message;

  SendCodeSucess(this.message);
}

final class SendCodeError extends AddOwnerAndHospitalState {
  final String errMessage;

  SendCodeError(this.errMessage);
}

final class VerifyCodeLoading extends AddOwnerAndHospitalState {}

final class VerifyCodeSuccess extends AddOwnerAndHospitalState {
  final String message;

  VerifyCodeSuccess(this.message);
}

final class VerifyCodeError extends AddOwnerAndHospitalState {
  final String errMessage;

  VerifyCodeError(this.errMessage);
}

final class AddUserLoading extends AddOwnerAndHospitalState {}

final class AddUserSuccess extends AddOwnerAndHospitalState {
  final String message;

  AddUserSuccess(this.message);
}

final class AddUserError extends AddOwnerAndHospitalState {
  final String errMessage;

  AddUserError(this.errMessage);
}

final class GetAllOwnerLoading extends AddOwnerAndHospitalState {}

final class GetAllOwnerSuccess extends AddOwnerAndHospitalState {
  final List<Users> users;

  GetAllOwnerSuccess(this.users);
}

final class GetAllOwnerError extends AddOwnerAndHospitalState {
  final String errMessage;

  GetAllOwnerError(this.errMessage);
}

final class GetUserLoading extends AddOwnerAndHospitalState {}

final class GetUserSuccess extends AddOwnerAndHospitalState {
  final List<UserModel> user;

  GetUserSuccess(this.user);
}

final class GetUserError extends AddOwnerAndHospitalState {
  final String errMessage;

  GetUserError(this.errMessage);
}

final class UpdateUserLoading extends AddOwnerAndHospitalState {}

final class UpdateUserSuccess extends AddOwnerAndHospitalState {
  final String message;

  UpdateUserSuccess(this.message);
}

final class UpdateUserEmailPending extends AddOwnerAndHospitalState {
  final String message;
  final String email;
  UpdateUserEmailPending(this.message, this.email);
}

final class UpdateUserError extends AddOwnerAndHospitalState {
  final String errMessage;

  UpdateUserError(this.errMessage);
}

final class VerifyUpdatedEmailUserLoading extends AddOwnerAndHospitalState {}

final class VerifyUpdatedEmailUserSuccess extends AddOwnerAndHospitalState {
  final String message;

  VerifyUpdatedEmailUserSuccess(this.message);
}

final class VerifyUpdatedEmailUserError extends AddOwnerAndHospitalState {
  final String errMessage;

  VerifyUpdatedEmailUserError(this.errMessage);
}

final class DeleteUserLoading extends AddOwnerAndHospitalState {}

final class DeleteUserSuccess extends AddOwnerAndHospitalState {
  final String message;

  DeleteUserSuccess(this.message);
}

final class DeleteUserError extends AddOwnerAndHospitalState {
  final String errMessage;

  DeleteUserError(this.errMessage);
}

final class AddHospitalLoading extends AddOwnerAndHospitalState {}

final class AddHospitalSuccess extends AddOwnerAndHospitalState {
  final String message;

  AddHospitalSuccess(this.message);
}

final class AddHospitalError extends AddOwnerAndHospitalState {
  final String errMessage;

  AddHospitalError(this.errMessage);
}

final class GetAllEmergenciesLoading extends AddOwnerAndHospitalState {}

final class GetAllEmergenciesSuccess extends AddOwnerAndHospitalState {
  final List<AllEmergenciesModel> emergencies;

  GetAllEmergenciesSuccess(this.emergencies);
}

final class GetAllEmergenciesError extends AddOwnerAndHospitalState {
  final String errMessage;

  GetAllEmergenciesError(this.errMessage);
}

final class GetEmergencyLoading extends AddOwnerAndHospitalState {}

final class GetEmergencySuccess extends AddOwnerAndHospitalState {
  final List<EmergencyModel> emergency;

  GetEmergencySuccess(this.emergency);
}

final class GetEmergencyError extends AddOwnerAndHospitalState {
  final String errMessage;

  GetEmergencyError(this.errMessage);
}

final class DeleteEmergencyLoading extends AddOwnerAndHospitalState {}

final class DeleteEmergencySuccess extends AddOwnerAndHospitalState {
  final String message;

  DeleteEmergencySuccess(this.message);
}

final class DeleteEmergencyError extends AddOwnerAndHospitalState {
  final String errMessage;

  DeleteEmergencyError(this.errMessage);
}

final class UpdateEmergencyLoading extends AddOwnerAndHospitalState {}

final class UpdateEmergencySuccess extends AddOwnerAndHospitalState {
  final String message;

  UpdateEmergencySuccess(this.message);
}

final class UpdateEmergencyError extends AddOwnerAndHospitalState {
  final String errMessage;

  UpdateEmergencyError(this.errMessage);
}

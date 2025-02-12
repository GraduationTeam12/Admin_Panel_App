import 'package:admin_panel_app/core/api/end_points.dart';
import 'package:admin_panel_app/core/cache/cache_helper.dart';
import 'package:admin_panel_app/core/data/repo/auth_repo.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_and_hospital_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOwnerAndHospitalCubit extends Cubit<AddOwnerAndHospitalState> {
  AddOwnerAndHospitalCubit(this.authRepository) : super(AddOwnerInitial());

  final AuthRepository authRepository;
  TextEditingController emailController = TextEditingController();

  Key addOwnerSendOtpFormKey = UniqueKey();
  Key addOwnerVerifyOtpFormKey = UniqueKey();
  Key addOwnerUserInfoFormKey = UniqueKey();
  Key addHospitalFormKey = UniqueKey();
  final token = CacheHelper().getData(key: ApiKeys.token);

  void sendCode() async {
    emit(SendCodeLoading());

    final res = await authRepository.sendCode(emailController.text, token);
    res.fold((l) => emit(SendCodeError(l)), (r) => emit(SendCodeSucess(r)));
  }

  TextEditingController codeController = TextEditingController();

  void verifyCode() async {
    emit(VerifyCodeLoading());

    final res = await authRepository.verifyCode(
        emailController.text, codeController.text, token);
    res.fold(
        (l) => emit(VerifyCodeError(l)), (r) => emit(VerifyCodeSuccess(r)));
  }

  TextEditingController userEmailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController boardIdController = TextEditingController();

  void sendUserData() async {
    emit(AddUserLoading());

    int age = int.parse(ageController.text);
    int nationalId = int.parse(nationalIdController.text);

    final res = await authRepository.sendUserData(
        userEmailController.text,
        userNameController.text,
        phoneController.text,
        age,
        addressController.text,
        nationalId,
        boardIdController.text,
        token);
    res.fold((l) => emit(AddUserError(l)), (r) {
      emit(AddUserSuccess(r));
      clearOwnerFormFields();
    });
  }

  void clearOwnerFormFields() {
    emailController.clear();
    userEmailController.clear();
    userNameController.clear();
    phoneController.clear();
    ageController.clear();
    addressController.clear();
    nationalIdController.clear();
    boardIdController.clear();
  }

  void getAllOwners() async {
    emit(GetAllOwnerLoading());

    final res = await authRepository.getAllOwners(token);

    res.fold(
        (l) => emit(GetAllOwnerError(l)), (r) => emit(GetAllOwnerSuccess(r)));
  }

  void getUser(id) async {
    emit(GetUserLoading());

    final res = await authRepository.getUser(id, token);

    res.fold((l) => emit(GetUserError(l)), (r) => emit(GetUserSuccess(r)));
  }

  void updateUser(Map<String, dynamic> updatedData, id) async {
    emit(UpdateUserLoading());

    final res = await authRepository.updateUser(updatedData, id, token);

    res.fold(
        (l) => emit(UpdateUserError(l)),
        (r) => r.status == 'pending'
            ? emit(UpdateUserEmailPending(r.msg))
            : emit(UpdateUserSuccess(r.msg)));
  }

  void verifyUpdatedEmail(email, code, id) async {
    emit(VerifyUpdatedEmailUserLoading());

    final res = await authRepository.verifyUpdatedEmail(email, code, id, token);
    res.fold((l) => emit(VerifyUpdatedEmailUserError(l)),
        (r) => emit(VerifyUpdatedEmailUserSuccess(r)));
  }

  void deleteUser(id) async {
    emit(DeleteUserLoading());

    final res = await authRepository.deleteUser(id, token);

    res.fold(
        (l) => emit(DeleteUserError(l)), (r) => emit(DeleteUserSuccess(r)));
  }

  TextEditingController hospitalEmailController = TextEditingController();
  TextEditingController hospitalNameController = TextEditingController();
  TextEditingController hospitalPhoneController = TextEditingController();
  TextEditingController hospitalPasswordController = TextEditingController();
  TextEditingController hospitalAddressController = TextEditingController();
  TextEditingController hospitalNumberController = TextEditingController();
  TextEditingController hospitalTypeController = TextEditingController();
  TextEditingController hospitalLatitudeController = TextEditingController();
  TextEditingController hospitalLongitudeController = TextEditingController();

  void addHospital() async {
    emit(AddHospitalLoading());

    final res = await authRepository.addHospital(
        hospitalTypeController.text,
        hospitalNameController.text,
        hospitalPhoneController.text,
        hospitalAddressController.text,
        hospitalNumberController.text,
        hospitalLatitudeController.text,
        hospitalLongitudeController.text,
        hospitalPasswordController.text,
        hospitalEmailController.text,
        token);

    res.fold(
        (l) => emit(AddHospitalError(l)), (r) => emit(AddHospitalSuccess(r)));
  }

  void clearHospitalFormFields() {
    hospitalNameController.clear();
    hospitalEmailController.clear();
    hospitalPhoneController.clear();
    hospitalAddressController.clear();
    hospitalNumberController.clear();
    hospitalTypeController.clear();
    hospitalLatitudeController.clear();
    hospitalLongitudeController.clear();
    hospitalPasswordController.clear();
  }

  void getAllEmergencies() async {
    emit(GetAllEmergenciesLoading());

    final res = await authRepository.getAllEmergencies(token);

    res.fold((l) => emit(GetAllEmergenciesError(l)),
        (r) => emit(GetAllEmergenciesSuccess(r)));
  }

  void getEmergency(id) async {
    emit(GetEmergencyLoading());

    final res = await authRepository.getEmergency(id, token);

    res.fold(
        (l) => emit(GetEmergencyError(l)), (r) => emit(GetEmergencySuccess(r)));
  }

  void deleteEmergency(id) async {
    emit(DeleteEmergencyLoading());
    final res = await authRepository.deleteEmergency(id, token);

    res.fold(
      (error) {
        debugPrint("Delete failed for id: $id. Error: $error");
        emit(DeleteEmergencyError(error));
      },
      (message) {
        debugPrint("Successfully deleted id: $id");
        emit(DeleteEmergencySuccess(message));
      },
    );
  }

  void updateEmergency(Map<String, dynamic> updatedData, id) async {
    emit(UpdateEmergencyLoading());

    final res = await authRepository.updateEmergency(updatedData, id, token);

    res.fold((l) => emit(UpdateEmergencyError(l)),
        (r) => emit(UpdateEmergencySuccess(r)));
  }
}

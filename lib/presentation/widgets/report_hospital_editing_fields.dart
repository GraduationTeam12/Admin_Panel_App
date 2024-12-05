import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:admin_panel_app/constants/pages_name.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_and_hospital_cubit.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_and_hospital_state.dart';
import 'package:admin_panel_app/presentation/dash_board/hospital_report.dart';
import 'package:admin_panel_app/presentation/widgets/dialog_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportHospitalInformationEditingFields extends StatefulWidget {
  const ReportHospitalInformationEditingFields({
    super.key,
    required this.id,
    required this.typeCotroller,
    required this.nameCotroller,
    required this.numberCotroller,
    required this.emailCotroller,
    required this.addressCotroller,
    required this.phoneCotroller,
    required this.latitudeCotroller,
    required this.longitudeCotroller,
  });

  final String id;
  final TextEditingController typeCotroller;
  final TextEditingController nameCotroller;
  final TextEditingController numberCotroller;
  final TextEditingController emailCotroller;
  final TextEditingController addressCotroller;
  final TextEditingController phoneCotroller;
  final TextEditingController latitudeCotroller;
  final TextEditingController longitudeCotroller;

  @override
  State<ReportHospitalInformationEditingFields> createState() =>
      _ReportHospitalInformationEditingFieldsState();
}

class _ReportHospitalInformationEditingFieldsState
    extends State<ReportHospitalInformationEditingFields> {
  GlobalKey<FormState> formEditingKey = GlobalKey();

  late Map<String, String> originalData;

  @override
  void initState() {
    super.initState();
    originalData = {
      'type': widget.typeCotroller.text,
      'name': widget.nameCotroller.text,
      'number': widget.numberCotroller.text,
      'email': widget.emailCotroller.text,
      'address': widget.addressCotroller.text,
      'phone': widget.phoneCotroller.text,
      'latitude': widget.latitudeCotroller.text,
      'longitude': widget.longitudeCotroller.text,
    };
  }

  Map<String, String> getTheUpdatedData() {
    Map<String, String> updatedData = {};

    if (widget.typeCotroller.text != originalData['type']) {
      updatedData['type'] = widget.typeCotroller.text;
    }

    if (widget.nameCotroller.text != originalData['name']) {
      updatedData['name'] = widget.nameCotroller.text;
    }
    if (widget.numberCotroller.text != originalData['number']) {
      updatedData['number'] = widget.numberCotroller.text;
    }
    if (widget.emailCotroller.text != originalData['email']) {
      updatedData['email'] = widget.emailCotroller.text;
    }
    if (widget.latitudeCotroller.text != originalData['latitude']) {
      updatedData['latitude'] = widget.latitudeCotroller.text;
    }
    if (widget.longitudeCotroller.text != originalData['longitude']) {
      updatedData['longitude'] = widget.longitudeCotroller.text;
    }
    if (widget.addressCotroller.text != originalData['address']) {
      updatedData['address'] = widget.addressCotroller.text;
    }
    if (widget.phoneCotroller.text != originalData['phone']) {
      updatedData['phone'] = widget.phoneCotroller.text;
    }

    return updatedData;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOwnerAndHospitalCubit, AddOwnerAndHospitalState>(
      listener: (context, state) {
        if (state is UpdateEmergencyLoading) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showLoadingDialog(context);
          });
        }

        if (state is UpdateEmergencySuccess) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, dashBoardScreen , arguments: HospitalReport());   
          String message = state.message;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(message),
            duration: const Duration(seconds: 5),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.only(bottom: 680, left: 160, right: 160),
          ));
        }

        if (state is UpdateEmergencyError) {
          Navigator.pop(context);
          String message = state.errMessage;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(message),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.only(bottom: 680, left: 160, right: 160),
          ));
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Form(
                key: formEditingKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Type",
                              style: AppStyle.styleRegular16(context),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: 340,
                              child: TextFormField(
                                // initialValue: "Ahmed Samy",
                                style: AppStyle.styleRegular16(context)
                                    .copyWith(color: Colors.black),
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                controller: widget.typeCotroller,
                                //     BlocProvider.of<LoginCubit>(context).signInEmail,
                                decoration: InputDecoration(
                                  errorStyle: AppStyle.styleRegular16(context)
                                      .copyWith(color: Colors.red),
                                  prefixIcon: const Icon(
                                    Icons.merge_type,
                                    color: Colors.black,
                                  ),

                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 2, color: MyColors.premiumColor),
                                  ),
                                  floatingLabelStyle:
                                      AppStyle.styleRegular16(context).copyWith(
                                    color: MyColors.premiumColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  contentPadding: const EdgeInsets.all(8),
                                  // enabledBorder: buildBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 2, color: MyColors.premiumColor),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.white),
                                  ),
                                ),
                                validator: (type) {
                                  if (type!.isEmpty) {
                                    return "Please enter the emergency type";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Phone",
                              style: AppStyle.styleRegular16(context),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: 340,
                              child: TextFormField(
                                // initialValue: "20",
                                style: AppStyle.styleRegular16(context)
                                    .copyWith(color: Colors.black),
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                controller: widget.phoneCotroller,
                                //     BlocProvider.of<LoginCubit>(context).signInEmail,
                                decoration: InputDecoration(
                                  errorStyle: AppStyle.styleRegular16(context)
                                      .copyWith(color: Colors.red),
                                  prefixIcon: const Icon(
                                    Icons.phone_iphone,
                                    color: Colors.black,
                                  ),

                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 2, color: MyColors.premiumColor),
                                  ),
                                  floatingLabelStyle:
                                      AppStyle.styleRegular16(context).copyWith(
                                    color: MyColors.premiumColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  contentPadding: const EdgeInsets.all(8),
                                  // enabledBorder: buildBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 2, color: MyColors.premiumColor),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.white),
                                  ),
                                ),
                                validator: (phone) {
                                  if (phone!.isEmpty) {
                                    return "Please enter the emergency phone number";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hospital Name",
                              style: AppStyle.styleRegular16(context),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: 340,
                              child: TextFormField(
                                // initialValue: "Ahmed Samy",
                                style: AppStyle.styleRegular16(context)
                                    .copyWith(color: Colors.black),
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                controller: widget.nameCotroller,
                                //     BlocProvider.of<LoginCubit>(context).signInEmail,
                                decoration: InputDecoration(
                                  errorStyle: AppStyle.styleRegular16(context)
                                      .copyWith(color: Colors.red),
                                  prefixIcon: const Icon(
                                    Icons.local_hospital,
                                    color: Colors.black,
                                  ),

                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 2, color: MyColors.premiumColor),
                                  ),
                                  floatingLabelStyle:
                                      AppStyle.styleRegular16(context).copyWith(
                                    color: MyColors.premiumColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  contentPadding: const EdgeInsets.all(8),
                                  // enabledBorder: buildBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 2, color: MyColors.premiumColor),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.white),
                                  ),
                                ),
                                validator: (name) {
                                  if (name!.isEmpty) {
                                    return "Please enter the emergency name";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Id Number",
                              style: AppStyle.styleRegular16(context),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: 340,
                              child: TextFormField(
                                // initialValue: "20",
                                style: AppStyle.styleRegular16(context)
                                    .copyWith(color: Colors.black),
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                controller: widget.numberCotroller,
                                //     BlocProvider.of<LoginCubit>(context).signInEmail,
                                decoration: InputDecoration(
                                  errorStyle: AppStyle.styleRegular16(context)
                                      .copyWith(color: Colors.red),
                                  prefixIcon: const Icon(
                                    Icons.credit_card,
                                    color: Colors.black,
                                  ),

                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 2, color: MyColors.premiumColor),
                                  ),
                                  floatingLabelStyle:
                                      AppStyle.styleRegular16(context).copyWith(
                                    color: MyColors.premiumColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  contentPadding: const EdgeInsets.all(8),
                                  // enabledBorder: buildBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 2, color: MyColors.premiumColor),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.white),
                                  ),
                                ),
                                validator: (number) {
                                  if (number!.isEmpty) {
                                    return "Please enter the emergency id number";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "E-mail",
                              style: AppStyle.styleRegular16(context),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: 340,
                              child: TextFormField(
                                // initialValue: "Ahmed SAMY994@gmail.com",
                                style: AppStyle.styleRegular16(context)
                                    .copyWith(color: Colors.black),
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                controller: widget.emailCotroller,
                                //     BlocProvider.of<LoginCubit>(context).signInEmail,
                                decoration: InputDecoration(
                                  errorStyle: AppStyle.styleRegular16(context)
                                      .copyWith(color: Colors.red),
                                  prefixIcon: const Icon(
                                    Icons.email_outlined,
                                    color: Colors.black,
                                  ),

                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 2, color: MyColors.premiumColor),
                                  ),
                                  floatingLabelStyle:
                                      AppStyle.styleRegular16(context).copyWith(
                                    color: MyColors.premiumColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  contentPadding: const EdgeInsets.all(8),
                                  // enabledBorder: buildBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 2, color: MyColors.premiumColor),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.white),
                                  ),
                                ),
                                validator: (email) {
                                  if (email!.isEmpty) {
                                    return "Please enter the emergency email";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Address",
                              style: AppStyle.styleRegular16(context),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: 340,
                              child: TextFormField(
                                // initialValue: "3011120004587",
                                style: AppStyle.styleRegular16(context)
                                    .copyWith(color: Colors.black),
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                controller: widget.addressCotroller,
                                //     BlocProvider.of<LoginCubit>(context).signInEmail,
                                decoration: InputDecoration(
                                  errorStyle: AppStyle.styleRegular16(context)
                                      .copyWith(color: Colors.red),
                                  prefixIcon: const Icon(
                                    Icons.place_outlined,
                                    color: Colors.black,
                                  ),

                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 2, color: MyColors.premiumColor),
                                  ),
                                  floatingLabelStyle:
                                      AppStyle.styleRegular16(context).copyWith(
                                    color: MyColors.premiumColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  contentPadding: const EdgeInsets.all(8),
                                  // enabledBorder: buildBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 2, color: MyColors.premiumColor),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.white),
                                  ),
                                ),
                                validator: (id) {
                                  if (id!.isEmpty) {
                                    return "Please enter the emergency address";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Latitude",
                              style: AppStyle.styleRegular16(context),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: 340,
                              child: TextFormField(
                                // initialValue: "Elzagazag,elzraha",
                                style: AppStyle.styleRegular16(context)
                                    .copyWith(color: Colors.black),
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                controller: widget.latitudeCotroller,
                                //     BlocProvider.of<LoginCubit>(context).signInEmail,
                                decoration: InputDecoration(
                                  errorStyle: AppStyle.styleRegular16(context)
                                      .copyWith(color: Colors.red),
                                  prefixIcon: const Icon(
                                    Icons.location_on,
                                    color: Colors.black,
                                  ),

                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 2, color: MyColors.premiumColor),
                                  ),
                                  floatingLabelStyle:
                                      AppStyle.styleRegular16(context).copyWith(
                                    color: MyColors.premiumColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  contentPadding: const EdgeInsets.all(8),
                                  // enabledBorder: buildBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 2, color: MyColors.premiumColor),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.white),
                                  ),
                                ),
                                validator: (latitude) {
                                  if (latitude!.isEmpty) {
                                    return "Please enter the emergency latitude";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Longitude",
                              style: AppStyle.styleRegular16(context),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: 340,
                              child: TextFormField(
                                // initialValue: "01207619792",
                                style: AppStyle.styleRegular16(context)
                                    .copyWith(color: Colors.black),
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                controller: widget.longitudeCotroller,
                                //     BlocProvider.of<LoginCubit>(context).signInEmail,
                                decoration: InputDecoration(
                                  errorStyle: AppStyle.styleRegular16(context)
                                      .copyWith(color: Colors.red),
                                  prefixIcon: const Icon(
                                    Icons.location_on,
                                    color: Colors.black,
                                  ),

                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 2, color: MyColors.premiumColor),
                                  ),
                                  floatingLabelStyle:
                                      AppStyle.styleRegular16(context).copyWith(
                                    color: MyColors.premiumColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  contentPadding: const EdgeInsets.all(8),
                                  // enabledBorder: buildBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 2, color: MyColors.premiumColor),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.white),
                                  ),
                                ),
                                validator: (longitude) {
                                  if (longitude!.isEmpty) {
                                    return "Please enter the emergency longitude";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: 380,
                      height: 47,
                      child: ElevatedButton(
                        onPressed: () {
                          if (!formEditingKey.currentState!.validate()) {
                            return;
                          } else {
                            final updatedData = getTheUpdatedData();
                            if (updatedData.isNotEmpty) {
                              BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                                  .updateEmergency(updatedData, widget.id);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("No changes detected."),
                                behavior: SnackBarBehavior.floating,
                                duration: Duration(seconds: 5),
                                margin: EdgeInsets.only(
                                    bottom: 680, left: 160, right: 160),
                              ));
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.premiumColor,
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          "Save",
                          style: AppStyle.styleRegular25(context).copyWith(
                              fontSize: 25,
                              fontFamily: 'Inter',
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        );
      },
    );
  }
}

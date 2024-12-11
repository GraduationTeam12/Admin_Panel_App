import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:admin_panel_app/constants/pages_name.dart';
import 'package:admin_panel_app/core/api/dio_consumer.dart';
import 'package:admin_panel_app/core/api/end_points.dart';
import 'package:admin_panel_app/core/data/repo/auth_repo.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_and_hospital_cubit.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_and_hospital_state.dart';
import 'package:admin_panel_app/presentation/dash_board/owner_reports.dart';
import 'package:admin_panel_app/presentation/widgets/dialog_animation.dart';
import 'package:admin_panel_app/presentation/widgets/update_email_otp.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportInformationEditingFields extends StatefulWidget {
  const ReportInformationEditingFields({
    super.key,
    required this.id,
    required this.userNameCotroller,
    required this.ageCotroller,
    required this.emailCotroller,
    required this.nationalIdCotroller,
    required this.addressCotroller,
    required this.phoneCotroller,
  });

  final String id;
  final TextEditingController userNameCotroller;
  final TextEditingController ageCotroller;
  final TextEditingController emailCotroller;
  final TextEditingController nationalIdCotroller;
  final TextEditingController addressCotroller;
  final TextEditingController phoneCotroller;

  @override
  State<ReportInformationEditingFields> createState() =>
      _ReportInformationEditingFieldsState();
}

class _ReportInformationEditingFieldsState
    extends State<ReportInformationEditingFields> {
  GlobalKey<FormState> formKeyyy = GlobalKey();

  late Map<String, String> originalData;

  @override
  void initState() {
    super.initState();
    originalData = {
      ApiKeys.username: widget.userNameCotroller.text,
      ApiKeys.age: widget.ageCotroller.text,
      ApiKeys.email: widget.emailCotroller.text,
      ApiKeys.nationalId: widget.nationalIdCotroller.text,
      ApiKeys.address: widget.addressCotroller.text,
      ApiKeys.phone: widget.phoneCotroller.text,
    };
  }

  Map<String, String> getUpdatedData() {
    Map<String, String> updatedData = {};

    if (widget.userNameCotroller.text != originalData[ApiKeys.username]) {
      updatedData[ApiKeys.username] = widget.userNameCotroller.text;
    }
    if (widget.ageCotroller.text != originalData[ApiKeys.age]) {
      updatedData[ApiKeys.age] = widget.ageCotroller.text;
    }
    if (widget.emailCotroller.text != originalData[ApiKeys.email]) {
      updatedData[ApiKeys.email] = widget.emailCotroller.text;
    }
    if (widget.nationalIdCotroller.text != originalData[ApiKeys.nationalId]) {
      updatedData[ApiKeys.nationalId] = widget.nationalIdCotroller.text;
    }
    if (widget.addressCotroller.text != originalData[ApiKeys.address]) {
      updatedData[ApiKeys.address] = widget.addressCotroller.text;
    }
    if (widget.phoneCotroller.text != originalData[ApiKeys.phone]) {
      updatedData[ApiKeys.phone] = widget.phoneCotroller.text;
    }

    return updatedData;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOwnerAndHospitalCubit, AddOwnerAndHospitalState>(
      listener: (context, state) {
        if (state is UpdateUserLoading) {
            MediaQuery.sizeOf(context).width < 800 ?   showLoadingDialog(context) :
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showLoadingDialog(context);
          });
        }

        if (state is UpdateUserSuccess) {
          
            // MediaQuery.sizeOf(context).width < 800 ? Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context)=> OwnerReports()),
            //    ) :
          Navigator.pop(context);
          
          Navigator.pushReplacementNamed(context, dashBoardScreen,
              arguments: OwnerReports());
          // context.read<NavigationCubit>().navigateTo(10);
          String message = state.message;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(message),
            duration: const Duration(seconds: 5),
            behavior: SnackBarBehavior.floating,
            margin: MediaQuery.sizeOf(context).width < 800 ? null : const EdgeInsets.only(bottom: 680, left: 160, right: 160),
          ));
        }

        if (state is UpdateUserEmailPending) {
          final updatedData = getUpdatedData();
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider(
                        create: (context) => AddOwnerAndHospitalCubit(
                            AuthRepository(
                                apiConsumer: DioConsumer(dio: Dio()))),
                        child: OtpUpdatedEmail(
                          emailText: updatedData[ApiKeys.email]!,
                          id: widget.id,
                        ),
                      )));
          String message = state.message;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(message),
            duration: const Duration(seconds: 5),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.only(bottom: 680, left: 160, right: 160),
          ));
        }

        if (state is UpdateUserError) {
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
                key: formKeyyy,
                child: MediaQuery.sizeOf(context).width < 800
                    ? SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Full Name",
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
                                controller: widget.userNameCotroller,
                                //     BlocProvider.of<LoginCubit>(context).signInEmail,
                                decoration: InputDecoration(
                                  errorStyle: AppStyle.styleRegular16(context)
                                      .copyWith(color: Colors.red),
                                  prefixIcon: const Icon(
                                    Icons.person,
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
                                    return "Please enter your full name";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Age",
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
                                controller: widget.ageCotroller,
                                //     BlocProvider.of<LoginCubit>(context).signInEmail,
                                decoration: InputDecoration(
                                  errorStyle: AppStyle.styleRegular16(context)
                                      .copyWith(color: Colors.red),
                                  prefixIcon: const Icon(
                                    Icons.numbers_outlined,
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
                                validator: (age) {
                                  if (age!.isEmpty) {
                                    return "Please enter your Age";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
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
                                    return "Please enter your email";
                                  }
                                  return null;
                                },
                      
                                onChanged: (value) {},
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Id",
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
                                controller: widget.nationalIdCotroller,
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
                                validator: (id) {
                                  if (id!.isEmpty) {
                                    return "Please enter your id";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Location",
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
                                controller: widget.addressCotroller,
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
                                validator: (location) {
                                  if (location!.isEmpty) {
                                    return "Please enter your Location";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Phone Number",
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
                                    return "Please enter the phone number";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: 340,
                              height: 47,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (!formKeyyy.currentState!.validate()) {
                                    return;
                                  } else {
                                    final updatedData = getUpdatedData();
                                    if (updatedData.isNotEmpty) {
                                      BlocProvider.of<AddOwnerAndHospitalCubit>(
                                              context)
                                          .updateUser(updatedData, widget.id);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text("No changes detected."),
                                        behavior: SnackBarBehavior.floating,
                                        duration: Duration(seconds: 5),
                                       
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
                                  style: AppStyle.styleRegular25(context)
                                      .copyWith(
                                          fontSize: 25,
                                          fontFamily: 'Inter',
                                          color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                    )
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Full Name",
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
                                      controller: widget.userNameCotroller,
                                      //     BlocProvider.of<LoginCubit>(context).signInEmail,
                                      decoration: InputDecoration(
                                        errorStyle:
                                            AppStyle.styleRegular16(context)
                                                .copyWith(color: Colors.red),
                                        prefixIcon: const Icon(
                                          Icons.person,
                                          color: Colors.black,
                                        ),

                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 2,
                                              color: MyColors.premiumColor),
                                        ),
                                        floatingLabelStyle:
                                            AppStyle.styleRegular16(context)
                                                .copyWith(
                                          color: MyColors.premiumColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        contentPadding: const EdgeInsets.all(8),
                                        // enabledBorder: buildBorder(),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 2,
                                              color: MyColors.premiumColor),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.white),
                                        ),
                                      ),
                                      validator: (name) {
                                        if (name!.isEmpty) {
                                          return "Please enter your full name";
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
                                    "Age",
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
                                      controller: widget.ageCotroller,
                                      //     BlocProvider.of<LoginCubit>(context).signInEmail,
                                      decoration: InputDecoration(
                                        errorStyle:
                                            AppStyle.styleRegular16(context)
                                                .copyWith(color: Colors.red),
                                        prefixIcon: const Icon(
                                          Icons.numbers_outlined,
                                          color: Colors.black,
                                        ),

                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 2,
                                              color: MyColors.premiumColor),
                                        ),
                                        floatingLabelStyle:
                                            AppStyle.styleRegular16(context)
                                                .copyWith(
                                          color: MyColors.premiumColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        contentPadding: const EdgeInsets.all(8),
                                        // enabledBorder: buildBorder(),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 2,
                                              color: MyColors.premiumColor),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.white),
                                        ),
                                      ),
                                      validator: (age) {
                                        if (age!.isEmpty) {
                                          return "Please enter your Age";
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
                                        errorStyle:
                                            AppStyle.styleRegular16(context)
                                                .copyWith(color: Colors.red),
                                        prefixIcon: const Icon(
                                          Icons.email_outlined,
                                          color: Colors.black,
                                        ),

                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 2,
                                              color: MyColors.premiumColor),
                                        ),
                                        floatingLabelStyle:
                                            AppStyle.styleRegular16(context)
                                                .copyWith(
                                          color: MyColors.premiumColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        contentPadding: const EdgeInsets.all(8),
                                        // enabledBorder: buildBorder(),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 2,
                                              color: MyColors.premiumColor),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.white),
                                        ),
                                      ),
                                      validator: (email) {
                                        if (email!.isEmpty) {
                                          return "Please enter your email";
                                        }
                                        return null;
                                      },

                                      onChanged: (value) {},
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
                                    "Id",
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
                                      controller: widget.nationalIdCotroller,
                                      //     BlocProvider.of<LoginCubit>(context).signInEmail,
                                      decoration: InputDecoration(
                                        errorStyle:
                                            AppStyle.styleRegular16(context)
                                                .copyWith(color: Colors.red),
                                        prefixIcon: const Icon(
                                          Icons.credit_card,
                                          color: Colors.black,
                                        ),

                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 2,
                                              color: MyColors.premiumColor),
                                        ),
                                        floatingLabelStyle:
                                            AppStyle.styleRegular16(context)
                                                .copyWith(
                                          color: MyColors.premiumColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        contentPadding: const EdgeInsets.all(8),
                                        // enabledBorder: buildBorder(),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 2,
                                              color: MyColors.premiumColor),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.white),
                                        ),
                                      ),
                                      validator: (id) {
                                        if (id!.isEmpty) {
                                          return "Please enter your id";
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
                                    "Location",
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
                                      controller: widget.addressCotroller,
                                      //     BlocProvider.of<LoginCubit>(context).signInEmail,
                                      decoration: InputDecoration(
                                        errorStyle:
                                            AppStyle.styleRegular16(context)
                                                .copyWith(color: Colors.red),
                                        prefixIcon: const Icon(
                                          Icons.location_on,
                                          color: Colors.black,
                                        ),

                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 2,
                                              color: MyColors.premiumColor),
                                        ),
                                        floatingLabelStyle:
                                            AppStyle.styleRegular16(context)
                                                .copyWith(
                                          color: MyColors.premiumColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        contentPadding: const EdgeInsets.all(8),
                                        // enabledBorder: buildBorder(),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 2,
                                              color: MyColors.premiumColor),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.white),
                                        ),
                                      ),
                                      validator: (location) {
                                        if (location!.isEmpty) {
                                          return "Please enter your Location";
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
                                    "Phone Number",
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
                                      controller: widget.phoneCotroller,
                                      //     BlocProvider.of<LoginCubit>(context).signInEmail,
                                      decoration: InputDecoration(
                                        errorStyle:
                                            AppStyle.styleRegular16(context)
                                                .copyWith(color: Colors.red),
                                        prefixIcon: const Icon(
                                          Icons.phone_iphone,
                                          color: Colors.black,
                                        ),

                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 2,
                                              color: MyColors.premiumColor),
                                        ),
                                        floatingLabelStyle:
                                            AppStyle.styleRegular16(context)
                                                .copyWith(
                                          color: MyColors.premiumColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        contentPadding: const EdgeInsets.all(8),
                                        // enabledBorder: buildBorder(),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 2,
                                              color: MyColors.premiumColor),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.white),
                                        ),
                                      ),
                                      validator: (phone) {
                                        if (phone!.isEmpty) {
                                          return "Please enter the phone number";
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
                                if (!formKeyyy.currentState!.validate()) {
                                  return;
                                } else {
                                  final updatedData = getUpdatedData();
                                  if (updatedData.isNotEmpty) {
                                    BlocProvider.of<AddOwnerAndHospitalCubit>(
                                            context)
                                        .updateUser(updatedData, widget.id);
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
                                style: AppStyle.styleRegular25(context)
                                    .copyWith(
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

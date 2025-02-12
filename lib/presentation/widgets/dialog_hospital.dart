import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_and_hospital_cubit.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_and_hospital_state.dart';
import 'package:admin_panel_app/presentation/widgets/dialog_animation.dart';
import 'package:admin_panel_app/presentation/widgets/dialog_success_hospital.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showHospitalFormDialog(BuildContext context) {
  // final _formKey = GlobalKey<FormState>();
  // String? name;
  // String? email;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BlocConsumer<AddOwnerAndHospitalCubit, AddOwnerAndHospitalState>(
        listener: (context, state) {
          if (state is AddHospitalLoading) {
            // Navigator.pop(context);
            showLoadingDialog(context);
          }

          if (state is AddHospitalSuccess) {
            Navigator.pop(context);
            Navigator.pop(context);
            showHospitalCheckDialog(context);
            // context.read<NavigationCubit>().navigateTo(1);
          }

          if (state is AddHospitalError) {
            Navigator.pop(context);
            Navigator.pop(context);
            String message = state.errMessage;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(message),
                behavior: SnackBarBehavior.floating,
                margin:
                    const EdgeInsets.only(bottom: 680, left: 160, right: 160)));
          }
        },
        builder: (context, state) {
          return AlertDialog(
            scrollable: true,
            titlePadding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            title: Container(
                width: double.infinity,
                height: 100,
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.white,
                    shadows: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        spreadRadius: 0,
                        offset: Offset(0, 4),
                        blurRadius: 4,
                      )
                    ]),
                child: Center(
                  child: Text(
                    'Confirm Information Sheet ',
                    style: AppStyle.styleSemiBold25(context)
                        .copyWith(color: MyColors.premiumColor),
                  ),
                )),
            content: Column(
              children: [
                Form(
                  // key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Type",
                        style: AppStyle.styleRegular16(context),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        initialValue:
                            BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                                .hospitalTypeController
                                .text,
                        style: AppStyle.styleRegular16(context)
                            .copyWith(color: Colors.black),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          errorStyle: AppStyle.styleRegular16(context)
                              .copyWith(color: Colors.red),
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 0,
                            minHeight: 0,
                          ),
                          prefixIcon: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.email_outlined,
                                color: Colors.black,
                              ),
                              SizedBox(width: 4),
                            ],
                          ),
                          isDense: true,
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.premiumColor, width: 1),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.premiumColor, width: 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Hospital Name",
                        style: AppStyle.styleRegular16(context),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        initialValue:
                            BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                                .hospitalNameController
                                .text,
                        style: AppStyle.styleRegular16(context)
                            .copyWith(color: Colors.black),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          errorStyle: AppStyle.styleRegular16(context)
                              .copyWith(color: Colors.red),
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 0,
                            minHeight: 0,
                          ),
                          prefixIcon: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              SizedBox(width: 4),
                            ],
                          ),
                          isDense: true,
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.premiumColor, width: 1),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.premiumColor, width: 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "E-mail",
                        style: AppStyle.styleRegular16(context),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        initialValue:
                            BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                                .hospitalEmailController
                                .text,
                        style: AppStyle.styleRegular16(context)
                            .copyWith(color: Colors.black),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          errorStyle: AppStyle.styleRegular16(context)
                              .copyWith(color: Colors.red),
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 0,
                            minHeight: 0,
                          ),
                          prefixIcon: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.email_outlined,
                                color: Colors.black,
                              ),
                              SizedBox(width: 4),
                            ],
                          ),
                          isDense: true,
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.premiumColor, width: 1),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.premiumColor, width: 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Password",
                        style: AppStyle.styleRegular16(context),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        initialValue:
                            BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                                .hospitalPasswordController
                                .text,
                        style: AppStyle.styleRegular16(context)
                            .copyWith(color: Colors.black),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          errorStyle: AppStyle.styleRegular16(context)
                              .copyWith(color: Colors.red),
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 0,
                            minHeight: 0,
                          ),
                          prefixIcon: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.password,
                                color: Colors.black,
                              ),
                              SizedBox(width: 4),
                            ],
                          ),
                          isDense: true,
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.premiumColor, width: 1),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.premiumColor, width: 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Location",
                        style: AppStyle.styleRegular16(context),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        initialValue:
                            BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                                .hospitalAddressController
                                .text,
                        style: AppStyle.styleRegular16(context)
                            .copyWith(color: Colors.black),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          errorStyle: AppStyle.styleRegular16(context)
                              .copyWith(color: Colors.red),
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 0,
                            minHeight: 0,
                          ),
                          prefixIcon: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.place_outlined,
                                color: Colors.black,
                              ),
                              SizedBox(width: 4),
                            ],
                          ),
                          isDense: true,
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.premiumColor, width: 1),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.premiumColor, width: 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Id Number",
                        style: AppStyle.styleRegular16(context),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        initialValue:
                            BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                                .hospitalNumberController
                                .text,
                        style: AppStyle.styleRegular16(context)
                            .copyWith(color: Colors.black),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          errorStyle: AppStyle.styleRegular16(context)
                              .copyWith(color: Colors.red),
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 0,
                            minHeight: 0,
                          ),
                          prefixIcon: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.credit_card,
                                color: Colors.black,
                              ),
                              SizedBox(width: 4),
                            ],
                          ),
                          isDense: true,
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.premiumColor, width: 1),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.premiumColor, width: 1),
                          ),
                        ),
                      ),
                      Text(
                        "Phone",
                        style: AppStyle.styleRegular16(context),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        initialValue:
                            BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                                .hospitalPhoneController
                                .text,
                        style: AppStyle.styleRegular16(context)
                            .copyWith(color: Colors.black),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          errorStyle: AppStyle.styleRegular16(context)
                              .copyWith(color: Colors.red),
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 0,
                            minHeight: 0,
                          ),
                          prefixIcon: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.phone_iphone,
                                color: Colors.black,
                              ),
                              SizedBox(width: 4),
                            ],
                          ),
                          isDense: true,
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.premiumColor, width: 1),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.premiumColor, width: 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Longitude",
                        style: AppStyle.styleRegular16(context),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        initialValue:
                            BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                                .hospitalLongitudeController
                                .text,
                        style: AppStyle.styleRegular16(context)
                            .copyWith(color: Colors.black),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          errorStyle: AppStyle.styleRegular16(context)
                              .copyWith(color: Colors.red),
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 0,
                            minHeight: 0,
                          ),
                          prefixIcon: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.black,
                              ),
                              SizedBox(width: 4),
                            ],
                          ),
                          isDense: true,
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.premiumColor, width: 1),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.premiumColor, width: 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Latitude",
                        style: AppStyle.styleRegular16(context),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        initialValue:
                            BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                                .hospitalLatitudeController
                                .text,
                        style: AppStyle.styleRegular16(context)
                            .copyWith(color: Colors.black),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          errorStyle: AppStyle.styleRegular16(context)
                              .copyWith(color: Colors.red),
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 0,
                            minHeight: 0,
                          ),
                          prefixIcon: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.black,
                              ),
                              SizedBox(width: 4),
                            ],
                          ),
                          isDense: true,
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.premiumColor, width: 1),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.premiumColor, width: 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
                // const Expanded(
                //   child: SizedBox(
                //     height: 30,
                //   ),
                // ),

                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 300,
                  height: 47,
                  child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                          .addHospital();
                      BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                          .clearHospitalFormFields();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.premiumColor,
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      "Confirm",
                      style: AppStyle.styleRegular25(context).copyWith(
                          fontSize: 25,
                          fontFamily: 'Inter',
                          color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 30,
                )
              ],
            ),
          );
        },
      );
    },
  );
}

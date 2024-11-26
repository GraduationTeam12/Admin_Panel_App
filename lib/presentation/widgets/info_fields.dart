 

import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_cubit.dart';
import 'package:admin_panel_app/core/logic/navigation_cubit/navigation_cubit.dart';
import 'package:admin_panel_app/presentation/widgets/add_owner_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoFields extends StatefulWidget {
  const InfoFields({super.key});

  @override
  State<InfoFields> createState() => InfoFieldsState();
}

class InfoFieldsState extends State<InfoFields> {
  GlobalKey<FormState> userInformationKey = GlobalKey();

  // TextEditingController fullNameController = TextEditingController();
  // TextEditingController ageController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  // TextEditingController locationController = TextEditingController();
  // TextEditingController idController = TextEditingController();

  static late String email;
  static late String userName;
  static late String age;
  static late String phoneNumber;
  static late String location;
  static late String nationalId;
  int index = 2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddOwnerBar(index: index),
        const SizedBox(
          height: 50,
        ),
        Text(
          "Add Owner to System",
          style: AppStyle.styleBold25(context).copyWith(
              fontSize: 37, fontFamily: 'Roboto', color: MyColors.premiumColor),
        ),
        const SizedBox(
          height: 20,
        ),
        Form(
            key: userInformationKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 340,
                      child: TextFormField(
                        controller: BlocProvider.of<AddOwnerCubit>(context)
                            .userNameController,
                        style: AppStyle.styleRegular16(context)
                            .copyWith(color: Colors.black),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        // controller:
                        //     BlocProvider.of<LoginCubit>(context).signInEmail,
                        decoration: InputDecoration(
                          errorStyle: AppStyle.styleRegular16(context)
                              .copyWith(color: Colors.red),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          labelText: "Full Name",
                          labelStyle: AppStyle.styleRegular16(context),
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
                            borderSide:
                                const BorderSide(width: 1, color: Colors.white),
                          ),
                        ),
                        validator: (name) {
                          if (name!.isEmpty) {
                            return "Please enter your full name";
                          }
                          return null;
                        },

                        onSaved: (value) {
                          userName = value!;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    SizedBox(
                      width: 340,
                      child: TextFormField(
                        controller: BlocProvider.of<AddOwnerCubit>(context)
                            .ageController,
                        style: AppStyle.styleRegular16(context)
                            .copyWith(color: Colors.black),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        // controller:
                        //     BlocProvider.of<LoginCubit>(context).signInEmail,
                        decoration: InputDecoration(
                          errorStyle: AppStyle.styleRegular16(context)
                              .copyWith(color: Colors.red),
                          prefixIcon: const Icon(
                            Icons.numbers_outlined,
                            color: Colors.black,
                          ),
                          labelText: "Age",
                          labelStyle: AppStyle.styleRegular16(context),
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
                            borderSide:
                                const BorderSide(width: 1, color: Colors.white),
                          ),
                        ),
                        validator: (age) {
                          if (age!.isEmpty) {
                            return "Please enter your Age";
                          }
                          return null;
                        },

                        onSaved: (value) {
                          age = value!;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 340,
                      child: TextFormField(
                        style: AppStyle.styleRegular16(context)
                            .copyWith(color: Colors.black),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        controller: BlocProvider.of<AddOwnerCubit>(context)
                            .userEmailController,
                        //     BlocProvider.of<LoginCubit>(context).signInEmail,
                        decoration: InputDecoration(
                          errorStyle: AppStyle.styleRegular16(context)
                              .copyWith(color: Colors.red),
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.black,
                          ),
                          labelText: "E-mail",
                          labelStyle: AppStyle.styleRegular16(context),
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
                            borderSide:
                                const BorderSide(width: 1, color: Colors.white),
                          ),
                        ),
                        validator: (email) {
                          if (email!.isEmpty) {
                            return "Please enter your email";
                          }
                          return null;
                        },

                        onSaved: (value) {
                          email = value!;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    SizedBox(
                      width: 340,
                      child: TextFormField(
                        controller: BlocProvider.of<AddOwnerCubit>(context)
                            .phoneController,
                        style: AppStyle.styleRegular16(context)
                            .copyWith(color: Colors.black),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        // controller:
                        //     BlocProvider.of<LoginCubit>(context).signInEmail,
                        decoration: InputDecoration(
                          errorStyle: AppStyle.styleRegular16(context)
                              .copyWith(color: Colors.red),
                          prefixIcon: const Icon(
                            Icons.phone_iphone,
                            color: Colors.black,
                          ),
                          labelText: "Phone Number",
                          labelStyle: AppStyle.styleRegular16(context),
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
                            borderSide:
                                const BorderSide(width: 1, color: Colors.white),
                          ),
                        ),
                        validator: (phone) {
                          if (phone!.isEmpty) {
                            return "Please enter your phone number";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          phoneNumber = value!;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 340,
                      child: TextFormField(
                        style: AppStyle.styleRegular16(context)
                            .copyWith(color: Colors.black),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        controller: BlocProvider.of<AddOwnerCubit>(context)
                            .addressController,
                        //     BlocProvider.of<LoginCubit>(context).signInEmail,
                        decoration: InputDecoration(
                          errorStyle: AppStyle.styleRegular16(context)
                              .copyWith(color: Colors.red),
                          prefixIcon: const Icon(
                            Icons.location_on,
                            color: Colors.black,
                          ),
                          labelText: "Location",
                          labelStyle: AppStyle.styleRegular16(context),
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
                            borderSide:
                                const BorderSide(width: 1, color: Colors.white),
                          ),
                        ),
                        validator: (location) {
                          if (location!.isEmpty) {
                            return "Please enter your Location";
                          }
                          return null;
                        },

                        onSaved: (value) {
                          location = value!;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    SizedBox(
                      width: 340,
                      child: TextFormField(
                        style: AppStyle.styleRegular16(context)
                            .copyWith(color: Colors.black),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        controller: BlocProvider.of<AddOwnerCubit>(context)
                            .nationalIdController,
                        //     BlocProvider.of<LoginCubit>(context).signInEmail,
                        decoration: InputDecoration(
                          errorStyle: AppStyle.styleRegular16(context)
                              .copyWith(color: Colors.red),
                          prefixIcon: const Icon(
                            Icons.credit_card,
                            color: Colors.black,
                          ),
                          labelText: "Id",
                          labelStyle: AppStyle.styleRegular16(context),
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
                            borderSide:
                                const BorderSide(width: 1, color: Colors.white),
                          ),
                        ),
                        validator: (id) {
                          if (id!.isEmpty) {
                            return "Please enter your Id";
                          }
                          return null;
                        },

                        onSaved: (value) {
                          nationalId = value!;
                        },
                      ),
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
                      if (!userInformationKey.currentState!.validate()) {
                        return;
                      } else {
                        context.read<NavigationCubit>().navigateTo(8);
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
                      "Continue",
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
  }
}

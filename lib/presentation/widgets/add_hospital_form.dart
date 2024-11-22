import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:admin_panel_app/presentation/widgets/dialog_hospital.dart';
import 'package:flutter/material.dart';

class AddHospitalForm extends StatelessWidget {
  const AddHospitalForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Add New Hospital to System",
          style: AppStyle.styleBold25(context).copyWith(
              fontSize: 40, fontFamily: 'Roboto', color: MyColors.premiumColor),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Make sure to write the required information and all",
          style: AppStyle.styleRegular17(context)
              .copyWith(fontSize: 17, fontFamily: 'Roboto'),
        ),
        Text(
          " the agreed-upon details ",
          style: AppStyle.styleRegular17(context).copyWith(
            fontSize: 17,
            fontFamily: 'Roboto',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Form(
          child: Column(
            children: [
              SizedBox(
                width: 380,
                child: TextFormField(
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
                      Icons.local_hospital,
                      color: Colors.black,
                    ),
                    labelText: "Hospital Name",
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
                      return "Please enter the hospital's name";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 380,
                child: TextFormField(
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
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 380,
                child: TextFormField(
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
                      Icons.credit_card,
                      color: Colors.black,
                    ),
                    labelText: "Id Number",
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
                      return "Please enter the id number";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 180,
                    child: TextFormField(
                      style: AppStyle.styleRegular16(context)
                          .copyWith(color: Colors.black),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      // controller:
                      //     BlocProvider.of<LoginCubit>(context).signInEmail,
                      decoration: InputDecoration(
                        errorStyle: AppStyle.styleRegular16(context)
                            .copyWith(color: Colors.red),
                        suffixIcon: const Icon(
                          Icons.place_outlined,
                          color: Colors.black,
                        ),
                        labelText: "Longitude",
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
                      validator: (longitude) {
                        if (longitude!.isEmpty) {
                          return "Please enter the longitude";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 180,
                    child: TextFormField(
                      style: AppStyle.styleRegular16(context)
                          .copyWith(color: Colors.black),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      // controller:
                      //     BlocProvider.of<LoginCubit>(context).signInEmail,
                      decoration: InputDecoration(
                        errorStyle: AppStyle.styleRegular16(context)
                            .copyWith(color: Colors.red),
                        suffixIcon: const Icon(
                          Icons.place_outlined,
                          color: Colors.black,
                        ),
                        labelText: "Latitude",
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
                      validator: (latitude) {
                        if (latitude!.isEmpty) {
                          return "Please enter the latitude";
                        }
                        return null;
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
                     showHospitalFormDialog(context);
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
                        fontSize: 25, fontFamily: 'Inter', color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

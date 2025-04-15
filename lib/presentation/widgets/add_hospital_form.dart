import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_and_hospital_cubit.dart';
import 'package:admin_panel_app/presentation/widgets/dialog_hospital.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddHospitalForm extends StatelessWidget {
  const AddHospitalForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      MediaQuery.sizeOf(context).width < 800 ? FittedBox(
        child: Text(
          "Add New Hospital to System",
          style: AppStyle.styleBold25(context).copyWith(
              fontSize: 40, fontFamily: 'Roboto', color: MyColors.premiumColor),
        ),
      ) : 
      Text(
        "Add New Hospital to System",
        style: AppStyle.styleBold25(context).copyWith(
            fontSize: 40, fontFamily: 'Roboto', color: MyColors.premiumColor),
      ),
      const SizedBox(
        height: 8,
      ),
      MediaQuery.sizeOf(context).width < 800 ? FittedBox(
        child: Text(
          "Make sure to write the required information and all",
          style: AppStyle.styleRegular17(context)
              .copyWith(fontSize: 17, fontFamily: 'Roboto'),
        ),
      ) :
      Text(
        "Make sure to write the required information and all",
        style: AppStyle.styleRegular17(context)
            .copyWith(fontSize: 17, fontFamily: 'Roboto'),
      ),
      Text(
        " the agreed-upon details ",
        style: AppStyle.styleRegular17(context).copyWith(
          fontSize: MediaQuery.sizeOf(context).width < 800 ? 15 : 17,
          fontFamily: 'Roboto',
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Form(
        key: BlocProvider.of<AddOwnerAndHospitalCubit>(context).hospitalKey,
        child: 
        MediaQuery.sizeOf(context).width < 800 ? 
        Column(
          children: [
              SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    style: AppStyle.styleRegular16(context)
                        .copyWith(color: Colors.black),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    controller: BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                        .hospitalTypeController,
                    //     BlocProvider.of<LoginCubit>(context).signInEmail,
                    decoration: InputDecoration(
                      errorStyle: AppStyle.styleRegular16(context)
                          .copyWith(color: Colors.red),
                      prefixIcon: const Icon(
                        Icons.merge_type,
                        color: Colors.black,
                      ),
                      labelText: "Type",
                      labelStyle: AppStyle.styleRegular16(context),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            width: 2, color: MyColors.premiumColor),
                      ),
                      floatingLabelStyle: AppStyle.styleRegular16(context).copyWith(
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
                        borderSide: const BorderSide(width: 1, color: Colors.white),
                      ),
                    ),
                    validator: (type) {
                      if (type!.isEmpty) {
                        return "Please enter type";
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 20,),

                  SizedBox(
              width: double.infinity,
              child: TextFormField(
                style: AppStyle.styleRegular16(context)
                    .copyWith(color: Colors.black),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,

                controller: BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                    .hospitalNameController,
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
                  floatingLabelStyle: AppStyle.styleRegular16(context).copyWith(
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
                    borderSide: const BorderSide(width: 1, color: Colors.white),
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

            const SizedBox(height: 20,),

              SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    style: AppStyle.styleRegular16(context)
                        .copyWith(color: Colors.black),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    controller: BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                        .hospitalEmailController,
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
                      floatingLabelStyle: AppStyle.styleRegular16(context).copyWith(
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
                        borderSide: const BorderSide(width: 1, color: Colors.white),
                      ),
                    ),
                    validator: (email) {
                      if (email!.isEmpty) {
                        return "Please enter the hospital's email";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20,),

                  SizedBox(
              width: double.infinity,
              child: TextFormField(
                style: AppStyle.styleRegular16(context)
                    .copyWith(color: Colors.black),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                controller: BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                    .hospitalPasswordController,
                // controller:
                //     BlocProvider.of<LoginCubit>(context).signInEmail,
                decoration: InputDecoration(
                  errorStyle: AppStyle.styleRegular16(context)
                      .copyWith(color: Colors.red),
                  prefixIcon: const Icon(
                    Icons.password,
                    color: Colors.black,
                  ),
                  labelText: "Password",
                  labelStyle: AppStyle.styleRegular16(context),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        width: 2, color: MyColors.premiumColor),
                  ),
                  floatingLabelStyle: AppStyle.styleRegular16(context).copyWith(
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
                    borderSide: const BorderSide(width: 1, color: Colors.white),
                  ),
                ),
                validator: (password) {
                  if (password!.isEmpty) {
                    return "Please enter the hospital's password";
                  }
                  return null;
                },
              ),
            ),

            const SizedBox(height: 20,),


              SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    style: AppStyle.styleRegular16(context)
                        .copyWith(color: Colors.black),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    controller: BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                        .hospitalNumberController,
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
                      floatingLabelStyle: AppStyle.styleRegular16(context).copyWith(
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
                        borderSide: const BorderSide(width: 1, color: Colors.white),
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

                const SizedBox(height: 20,),

                  SizedBox(
              width: double.infinity,
              child: TextFormField(
                style: AppStyle.styleRegular16(context)
                    .copyWith(color: Colors.black),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                controller: BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                    .hospitalPhoneController,
                // controller:
                //     BlocProvider.of<LoginCubit>(context).signInEmail,
                decoration: InputDecoration(
                  errorStyle: AppStyle.styleRegular16(context)
                      .copyWith(color: Colors.red),
                  prefixIcon: const Icon(
                    Icons.phone_iphone,
                    color: Colors.black,
                  ),
                  labelText: "Phone",
                  labelStyle: AppStyle.styleRegular16(context),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        width: 2, color: MyColors.premiumColor),
                  ),
                  floatingLabelStyle: AppStyle.styleRegular16(context).copyWith(
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
                    borderSide: const BorderSide(width: 1, color: Colors.white),
                  ),
                ),
                validator: (phone) {
                  if (phone!.isEmpty) {
                    return "Please enter the phone of hospital";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 20,),

              SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    style: AppStyle.styleRegular16(context)
                        .copyWith(color: Colors.black),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    controller:
                        BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                            .hospitalLongitudeController,
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
                const SizedBox(height: 20,),

                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    style: AppStyle.styleRegular16(context)
                        .copyWith(color: Colors.black),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    controller:
                        BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                            .hospitalLatitudeController,
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
                const SizedBox(height: 20,),

                  SizedBox(
              width: double.infinity,
              child: TextFormField(
                style: AppStyle.styleRegular16(context)
                    .copyWith(color: Colors.black),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                controller: BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                    .hospitalAddressController,
                // controller:
                //     BlocProvider.of<LoginCubit>(context).signInEmail,
                decoration: InputDecoration(
                  errorStyle: AppStyle.styleRegular16(context)
                      .copyWith(color: Colors.red),
                  prefixIcon: const Icon(
                    Icons.share_location,
                    color: Colors.black,
                  ),
                  labelText: "address",
                  labelStyle: AppStyle.styleRegular16(context),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        width: 2, color: MyColors.premiumColor),
                  ),
                  floatingLabelStyle: AppStyle.styleRegular16(context).copyWith(
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
                    borderSide: const BorderSide(width: 1, color: Colors.white),
                  ),
                ),
                validator: (address) {
                  if (address!.isEmpty) {
                    return "Please enter the hospital's address";
                  }
                  return null;
                },
              ),
            ),

            const SizedBox(height: 40,),

              SizedBox(
              width: double.infinity,
              height: 47,
              child: ElevatedButton(
                onPressed: () {
                  if (!BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                      .hospitalKey
                      .currentState!
                      .validate()) {
                    return;
                  } else {
                    showHospitalFormDialog(context);
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
                      fontSize: 25, fontFamily: 'Inter', color: Colors.white),
                ),
              ),
            ),

          ],
        )
         :
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 280,
                  child: TextFormField(
                    style: AppStyle.styleRegular16(context)
                        .copyWith(color: Colors.black),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    controller: BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                        .hospitalTypeController,
                    //     BlocProvider.of<LoginCubit>(context).signInEmail,
                    decoration: InputDecoration(
                      errorStyle: AppStyle.styleRegular16(context)
                          .copyWith(color: Colors.red),
                      prefixIcon: const Icon(
                        Icons.merge_type,
                        color: Colors.black,
                      ),
                      labelText: "Type",
                      labelStyle: AppStyle.styleRegular16(context),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            width: 2, color: MyColors.premiumColor),
                      ),
                      floatingLabelStyle: AppStyle.styleRegular16(context).copyWith(
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
                        borderSide: const BorderSide(width: 1, color: Colors.white),
                      ),
                    ),
                    validator: (type) {
                      if (type!.isEmpty) {
                        return "Please enter type";
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(width: 15,),


                SizedBox(
              width: 280,
              child: TextFormField(
                style: AppStyle.styleRegular16(context)
                    .copyWith(color: Colors.black),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,

                controller: BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                    .hospitalNameController,
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
                  floatingLabelStyle: AppStyle.styleRegular16(context).copyWith(
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
                    borderSide: const BorderSide(width: 1, color: Colors.white),
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
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 280,
                  child: TextFormField(
                    style: AppStyle.styleRegular16(context)
                        .copyWith(color: Colors.black),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    controller: BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                        .hospitalEmailController,
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
                      floatingLabelStyle: AppStyle.styleRegular16(context).copyWith(
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
                        borderSide: const BorderSide(width: 1, color: Colors.white),
                      ),
                    ),
                    validator: (email) {
                      if (email!.isEmpty) {
                        return "Please enter the hospital's email";
                      }else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(email)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(width: 15,),

                SizedBox(
              width: 280,
              child: TextFormField(
                style: AppStyle.styleRegular16(context)
                    .copyWith(color: Colors.black),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                controller: BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                    .hospitalPasswordController,
                // controller:
                //     BlocProvider.of<LoginCubit>(context).signInEmail,
                decoration: InputDecoration(
                  errorStyle: AppStyle.styleRegular16(context)
                      .copyWith(color: Colors.red),
                  prefixIcon: const Icon(
                    Icons.password,
                    color: Colors.black,
                  ),
                  labelText: "Password",
                  labelStyle: AppStyle.styleRegular16(context),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        width: 2, color: MyColors.premiumColor),
                  ),
                  floatingLabelStyle: AppStyle.styleRegular16(context).copyWith(
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
                    borderSide: const BorderSide(width: 1, color: Colors.white),
                  ),
                ),
                validator: (password) {
                  if (password!.isEmpty) {
                    return "Please enter the hospital's password";
                  }
                  return null;
                },
              ),
            ),
              ],
            ),
             
            
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 280,
                  child: TextFormField(
                    style: AppStyle.styleRegular16(context)
                        .copyWith(color: Colors.black),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    controller: BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                        .hospitalNumberController,
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
                      floatingLabelStyle: AppStyle.styleRegular16(context).copyWith(
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
                        borderSide: const BorderSide(width: 1, color: Colors.white),
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

                const SizedBox(width: 15,),

                  SizedBox(
              width: 280,
              child: TextFormField(
                style: AppStyle.styleRegular16(context)
                    .copyWith(color: Colors.black),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                controller: BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                    .hospitalPhoneController,
                // controller:
                //     BlocProvider.of<LoginCubit>(context).signInEmail,
                decoration: InputDecoration(
                  errorStyle: AppStyle.styleRegular16(context)
                      .copyWith(color: Colors.red),
                  prefixIcon: const Icon(
                    Icons.phone_iphone,
                    color: Colors.black,
                  ),
                  labelText: "Phone",
                  labelStyle: AppStyle.styleRegular16(context),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        width: 2, color: MyColors.premiumColor),
                  ),
                  floatingLabelStyle: AppStyle.styleRegular16(context).copyWith(
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
                    borderSide: const BorderSide(width: 1, color: Colors.white),
                  ),
                ),
                validator: (phone) {
                  if (phone!.isEmpty) {
                    return "Please enter the phone of hospital";
                  }
                  return null;
                },
              ),
            ),

              ],
            ),
             
          
            const SizedBox(
              height: 20,
            ),

              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 280,
                  child: TextFormField(
                    style: AppStyle.styleRegular16(context)
                        .copyWith(color: Colors.black),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    controller:
                        BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                            .hospitalLongitudeController,
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
                  width: 15,
                ),
                SizedBox(
                  width: 280,
                  child: TextFormField(
                    style: AppStyle.styleRegular16(context)
                        .copyWith(color: Colors.black),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    controller:
                        BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                            .hospitalLatitudeController,
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

            const SizedBox(height: 20,),

            SizedBox(
              width: 575,
              child: TextFormField(
                style: AppStyle.styleRegular16(context)
                    .copyWith(color: Colors.black),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                controller: BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                    .hospitalAddressController,
                // controller:
                //     BlocProvider.of<LoginCubit>(context).signInEmail,
                decoration: InputDecoration(
                  errorStyle: AppStyle.styleRegular16(context)
                      .copyWith(color: Colors.red),
                  prefixIcon: const Icon(
                    Icons.share_location,
                    color: Colors.black,
                  ),
                  labelText: "address",
                  labelStyle: AppStyle.styleRegular16(context),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        width: 2, color: MyColors.premiumColor),
                  ),
                  floatingLabelStyle: AppStyle.styleRegular16(context).copyWith(
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
                    borderSide: const BorderSide(width: 1, color: Colors.white),
                  ),
                ),
                validator: (address) {
                  if (address!.isEmpty) {
                    return "Please enter the hospital's address";
                  }
                  return null;
                },
              ),
            ),
           
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 575,
              height: 47,
              child: ElevatedButton(
                onPressed: () {
                  if (!BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                      .hospitalKey
                      .currentState!
                      .validate()) {
                    return;
                  } else {
                    showHospitalFormDialog(context);
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
                      fontSize: 25, fontFamily: 'Inter', color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}

import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:flutter/material.dart';

class ReportInformationEditingFields extends StatelessWidget {
  const ReportInformationEditingFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            child: Column(
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
                        initialValue: "Ahmed Samy",
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
                        initialValue: "20",
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
                        initialValue: "Ahmed SAMY994@gmail.com",
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
                        initialValue: "3011120004587",
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
                            borderSide:
                                const BorderSide(width: 1, color: Colors.white),
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
                        initialValue: "Elzagazag,elzraha",
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
                        initialValue: "01207619792",
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
                            borderSide:
                                const BorderSide(width: 1, color: Colors.white),
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
                onPressed: () {},
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
                      fontSize: 25, fontFamily: 'Inter', color: Colors.white),
                ),
              ),
            ),
          ],
        ))
      ],
    );
  }
}

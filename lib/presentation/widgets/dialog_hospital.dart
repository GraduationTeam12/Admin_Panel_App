import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:admin_panel_app/presentation/widgets/dialog_animation.dart';
import 'package:flutter/material.dart';

void showHospitalFormDialog(BuildContext context) {
  // final _formKey = GlobalKey<FormState>();
  // String? name;
  // String? email;

  showDialog(
    context: context,
    builder: (BuildContext context) {
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
                    "Hospital Name",
                    style: AppStyle.styleRegular16(context),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    initialValue: "Elahrar",
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
                        borderSide:
                            BorderSide(color: MyColors.premiumColor, width: 1),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: MyColors.premiumColor, width: 1),
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
                    initialValue: "Elahrar@gmail.com",
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
                        borderSide:
                            BorderSide(color: MyColors.premiumColor, width: 1),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: MyColors.premiumColor, width: 1),
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
                        "Giza Plateau, Al Haram, Giza Governorate, Egypt",
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
                        borderSide:
                            BorderSide(color: MyColors.premiumColor, width: 1),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: MyColors.premiumColor, width: 1),
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
                    initialValue: "5469822",
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
                        borderSide:
                            BorderSide(color: MyColors.premiumColor, width: 1),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: MyColors.premiumColor, width: 1),
                      ),
                    ),
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
              height: 180,
            ),
            SizedBox(
              width: 300,
              height: 47,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  showLoadingDialog(context);
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
                      fontSize: 25, fontFamily: 'Inter', color: Colors.white),
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
}

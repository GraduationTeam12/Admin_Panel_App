import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:flutter/material.dart';

void showReportHospitalFormDialog(
  BuildContext context,
  String type,
  String name,
  String email,
  String idNumber,
  String phone,
  String address,
  String longitude,
  String latitude,
) {
  // final _formKey = GlobalKey<FormState>();

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
            child: SizedBox(
              width: 500,
              child: Center(
                child: Text(
                  'Information',
                  style: AppStyle.styleSemiBold25(context)
                      .copyWith(color: MyColors.premiumColor),
                ),
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
                    initialValue: type,
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
                            Icons.merge_type,
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
                    "Hospital Name",
                    style: AppStyle.styleRegular16(context),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    initialValue: name,
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
                    initialValue: email,
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
                    initialValue: idNumber,
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

                  Text(
                    "Address",
                    style: AppStyle.styleRegular16(context),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    initialValue: address,
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
                            Icons.place,
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
                    "Phone",
                    style: AppStyle.styleRegular16(context),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    initialValue: phone,
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
                    "Longitude",
                    style: AppStyle.styleRegular16(context),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    initialValue: longitude,
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
                    "Latitude",
                    style: AppStyle.styleRegular16(context),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    initialValue: latitude,
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
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    },
  );
}

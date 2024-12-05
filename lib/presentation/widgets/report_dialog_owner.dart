import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:flutter/material.dart';

void showReportOwnerFormDialog(
    BuildContext context,
    String name,
    String email,
    String location,
    String phoneNumber,
    String id,
    String boardNumber) {
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
            child: Center(
              child: SizedBox(
                width: 500,
                child: Center(
                  child: Text(
                    'Information',
                    style: AppStyle.styleSemiBold25(context)
                        .copyWith(color: MyColors.premiumColor),
                  ),
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
                    "Full Name",
                    style: AppStyle.styleRegular16(context),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    initialValue:  name,
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
                  Text(
                    "Location",
                    style: AppStyle.styleRegular16(context),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    initialValue:
                         location,
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
                 
                  // TextFormField(
                  //   initialValue:  age,
                  //   style: AppStyle.styleRegular16(context)
                  //       .copyWith(color: Colors.black),
                  //   keyboardType: TextInputType.text,
                  //   textInputAction: TextInputAction.done,
                  //   decoration: InputDecoration(
                  //     errorStyle: AppStyle.styleRegular16(context)
                  //         .copyWith(color: Colors.red),
                  //     prefixIconConstraints: const BoxConstraints(
                  //       minWidth: 0,
                  //       minHeight: 0,
                  //     ),
                  //     prefixIcon: const Row(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: [
                  //         Icon(
                  //           Icons.numbers,
                  //           color: Colors.black,
                  //         ),
                  //         SizedBox(width: 4),
                  //       ],
                  //     ),
                  //     isDense: true,
                  //     enabledBorder: const UnderlineInputBorder(
                  //       borderSide:
                  //           BorderSide(color: MyColors.premiumColor, width: 1),
                  //     ),
                  //     focusedBorder: const UnderlineInputBorder(
                  //       borderSide:
                  //           BorderSide(color: MyColors.premiumColor, width: 1),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 8,
                  // ),
                  Text(
                    "Phone Number",
                    style: AppStyle.styleRegular16(context),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    initialValue:  phoneNumber,
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
                    "Id",
                    style: AppStyle.styleRegular16(context),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    initialValue:  id,
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
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Board Number",
                    style: AppStyle.styleRegular16(context),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    initialValue:  boardNumber,
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
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      );
    },
  );
}

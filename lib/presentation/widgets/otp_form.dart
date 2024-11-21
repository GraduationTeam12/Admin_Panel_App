import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:admin_panel_app/constants/pages_name.dart';
import 'package:admin_panel_app/core/logic/navigation_cubit/navigation_cubit.dart';
import 'package:admin_panel_app/presentation/widgets/add_owner_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddOwnerBar(index: index),
        const SizedBox(
          height: 50,
        ),
        Column(
          children: [
            Text(
              "OTP",
              style: AppStyle.styleBold25(context).copyWith(
                  fontSize: 47,
                  fontFamily: 'Roboto',
                  color: MyColors.premiumColor),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Please enter the 4 digit code sent to: ",
              style: AppStyle.styleRegular17(context).copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Roboto'),
            ),
            RichText(
                text: TextSpan(
                    text: "",
                    style: AppStyle.styleRegular17(context).copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto'),
                    children: <TextSpan>[
                  TextSpan(
                      text: 'you@example.com',
                      style: AppStyle.styleRegular17(context).copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: MyColors.premiumColor)),
                ])),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Form(
            child: Column(
          children: [
            Pinput(
              submittedPinTheme: PinTheme(
                margin: const EdgeInsets.symmetric(horizontal: 7),
                height: 70,
                width: 70,
                textStyle: AppStyle.styleRegular16(context)
                    .copyWith(color: Colors.black),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 225, 239, 247),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: makeShadowBox,
                  border: Border.all(color: MyColors.premiumColor, width: 2),
                ),
              ),
              errorTextStyle:
                  AppStyle.styleRegular16(context).copyWith(color: Colors.red),
              length: 4,
              focusNode: FocusNode(),
              defaultPinTheme: PinTheme(
                margin: const EdgeInsets.symmetric(horizontal: 7),
                height: 70,
                width: 70,
                textStyle: AppStyle.styleRegular16(context)
                    .copyWith(color: Colors.black),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: makeShadowBox,
                  border: Border.all(color: MyColors.premiumColor, width: 2),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter 4 digit code to reset your password";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 380,
              height: 47,
              child: ElevatedButton(
                onPressed: () {
                  context.read<NavigationCubit>().navigateTo(8);
                  // setState(() {
                  //   index == 1 ? index++ : null;

                  //   Navigator.pushReplacementNamed(context, infoOwnerScreen);
                  // });

                  // if (!BlocProvider.of<LoginCubit>(context)
                  //     .loginKey
                  //     .currentState!
                  //     .validate()) {
                  //   return;
                  // } else {
                  // BlocProvider.of<LoginCubit>(context).login();
                  // }
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
        ))
      ],
    );
  }
}

List<BoxShadow> get makeShadowBox {
  return const [
    BoxShadow(
      color: Color(0x3F000000),
      spreadRadius: 0,
      offset: Offset(0, 4),
      blurRadius: 4,
    )
  ];
}

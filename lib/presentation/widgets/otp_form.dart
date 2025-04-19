import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_and_hospital_cubit.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_and_hospital_state.dart';
import 'package:admin_panel_app/presentation/widgets/add_owner_bar.dart';
import 'package:admin_panel_app/presentation/widgets/dialog_animation.dart';
import 'package:admin_panel_app/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  int index = 1;
  bool hasError = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOwnerAndHospitalCubit, AddOwnerAndHospitalState>(
      listener: (context, state) {
        if (state is VerifyCodeLoading) {
          showLoadingDialog(context);
        }

        if (state is VerifyCodeSuccess) {
          Navigator.pop(context);
          setState(() {
            hasError = false; 
          });
          // context.read<NavigationCubit>().navigateTo(7);
          // Navigator.push(context, MaterialPageRoute(builder: (context) => UserInformation()));
          GoRouter.of(context).pushReplacementNamed(AppRouter.userInfo);
        }

        if (state is VerifyCodeError) {
          Navigator.pop(context);
          setState(() {
            hasError = true; 
          });
          String message = state.errMessage;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(message),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width > 1200 ? 320 : 30,
                  right: 30,
                  bottom: 10)));

          BlocProvider.of<AddOwnerAndHospitalCubit>(context)
              .verifyOtpKey
              .currentState!
              .validate();
        }
      },
      builder: (context, state) {
        return Column(
          children: [
          
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
                          text:
                              BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                                  .emailController
                                  .text,
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
                key: BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                    .verifyOtpKey,
                child: Column(
                  children: [
                    Pinput(
                      controller:
                          BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                              .codeController,
                              onChanged: (value) {
                      if (hasError) {
                        setState(() {
                          hasError = false; 
                        });
                      }
                    },
                      submittedPinTheme: PinTheme(
                        margin: const EdgeInsets.symmetric(horizontal: 7),
                        height: 70,
                        width: 70,
                        textStyle: AppStyle.styleRegular16(context).copyWith(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                          color: hasError ? Colors.red.shade100 : const Color.fromARGB(255, 225, 239, 247),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: makeShadowBox,
                          border: Border.all(
                              color:hasError ? Colors.red: MyColors.premiumColor, width: 2),
                        ),
                      ),
                      errorTextStyle: AppStyle.styleRegular16(context)
                          .copyWith(color: Colors.red),
                      length: 4,
                      focusNode: FocusNode(),
                      errorPinTheme: PinTheme(
                        margin: const EdgeInsets.symmetric(horizontal: 7),
                        height: 70,
                        width: 70,
                        textStyle: AppStyle.styleRegular16(context).copyWith(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red.shade100,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: makeShadowBox,
                          border: Border.all(
                              color: Colors.red, width: 2), 
                        ),
                      ),
                      defaultPinTheme: PinTheme(
                        margin: const EdgeInsets.symmetric(horizontal: 7),
                        height: 70,
                        width: 70,
                        textStyle: AppStyle.styleRegular16(context).copyWith(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: makeShadowBox,
                          border: Border.all(
                              color: MyColors.premiumColor, width: 2),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty||value.length < 4) {
                          return "Please enter 4 digit code to you";
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
                          if (!BlocProvider.of<AddOwnerAndHospitalCubit>(
                                  context)
                              .verifyOtpKey
                              .currentState!
                              .validate()) {
                            return;
                          } else {
                            BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                                .verifyCode();
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
             ,const SizedBox(
              height: 50,
            ),
            AddOwnerBar(index: index),
            
          ],
        );
      },
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

import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_cubit.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_state.dart';
import 'package:admin_panel_app/presentation/widgets/custom_container.dart';
import 'package:admin_panel_app/presentation/widgets/otp_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class OtpUpdatedEmail extends StatefulWidget {
  const OtpUpdatedEmail({super.key, required this.emailText, required this.id});

  final String emailText;
  final String id;

  @override
  State<OtpUpdatedEmail> createState() => _OtpUpdatedEmailState();
}

class _OtpUpdatedEmailState extends State<OtpUpdatedEmail> {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color.fromARGB(255, 232, 226, 226),
      child: CustomContainer(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlocConsumer<AddOwnerCubit, AddOwnerState>(
                    listener: (context, state) {
                      if (state is VerifyUpdatedEmailUserLoading) {
                        // WidgetsBinding.instance.addPostFrameCallback((_) {
                        //   showLoadingDialog(context);
                        // });
                      }

                      if (state is VerifyUpdatedEmailUserSuccess) {
                        Navigator.pop(context);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => BlocProvider(
                        //               create: (context) => AddOwnerCubit(AuthRepository(apiConsumer: DioConsumer(dio: Dio()))),
                        //               child: ReportOwnerEditingInformation(
                        //                   id: widget.id),
                        //             )));
                        String message = state.message;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(message),
                          duration: const Duration(seconds: 5),
                          behavior: SnackBarBehavior.floating,
                          margin: const EdgeInsets.only(
                              bottom: 680, left: 160, right: 160),
                        ));
                      }

                      if (state is VerifyUpdatedEmailUserError) {
                        Navigator.pop(context);
                        String message = state.errMessage;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(message),
                          duration: const Duration(seconds: 5),
                          behavior: SnackBarBehavior.floating,
                          margin: const EdgeInsets.only(
                              bottom: 680, left: 160, right: 160),
                        ));
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
                                style: AppStyle.styleRegular17(context)
                                    .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Roboto'),
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: "",
                                      style: AppStyle.styleRegular17(context)
                                          .copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Roboto'),
                                      children: <TextSpan>[
                                    TextSpan(
                                        text: widget.emailText,
                                        style: AppStyle.styleRegular17(context)
                                            .copyWith(
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
                              key: formKey,
                              child: Column(
                                children: [
                                  Pinput(
                                    controller: otpController,
                                    submittedPinTheme: PinTheme(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 7),
                                      height: 70,
                                      width: 70,
                                      textStyle:
                                          AppStyle.styleRegular16(context)
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w600),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 225, 239, 247),
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: makeShadowBox,
                                        border: Border.all(
                                            color: MyColors.premiumColor,
                                            width: 2),
                                      ),
                                    ),
                                    errorTextStyle:
                                        AppStyle.styleRegular16(context)
                                            .copyWith(color: Colors.red),
                                    length: 4,
                                    focusNode: FocusNode(),
                                    defaultPinTheme: PinTheme(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 7),
                                      height: 70,
                                      width: 70,
                                      textStyle:
                                          AppStyle.styleRegular16(context)
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w600),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: makeShadowBox,
                                        border: Border.all(
                                            color: MyColors.premiumColor,
                                            width: 2),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please enter 4 digit code to update email";
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
                                        if (!formKey.currentState!.validate()) {
                                          return;
                                        } else {
                                          BlocProvider.of<AddOwnerCubit>(
                                                  context)
                                              .verifyUpdatedEmail(
                                                  widget.emailText,
                                                  otpController.text,
                                                  widget.id);
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: MyColors.premiumColor,
                                        elevation: 6,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: Text(
                                        "Continue",
                                        style: AppStyle.styleRegular25(context)
                                            .copyWith(
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
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}

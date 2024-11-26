import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_cubit.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_state.dart';
import 'package:admin_panel_app/core/logic/navigation_cubit/navigation_cubit.dart';
import 'package:admin_panel_app/presentation/widgets/add_owner_bar.dart';
import 'package:admin_panel_app/presentation/widgets/dialog_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOwnerEmailForm extends StatefulWidget {
  const AddOwnerEmailForm({
    super.key,
  });

  @override
  State<AddOwnerEmailForm> createState() => AddOwnerEmailFormState();
}

class AddOwnerEmailFormState extends State<AddOwnerEmailForm> {
  static late String email;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOwnerCubit, AddOwnerState>(
      listener: (context, state) {
        if (state is SendCodeLoading) {
          showLoadingDialog(context);
        }

        if (state is SendCodeSucess) {
          Navigator.pop(context);
          context.read<NavigationCubit>().navigateTo(6);
        }

        if (state is SendCodeError) {
          Navigator.pop(context);
          String message = state.errMessage;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(message),
              behavior: SnackBarBehavior.floating,
              margin:
                  const EdgeInsets.only(bottom: 680, left: 160, right: 160)));
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            AddOwnerBar(index: index),
            const SizedBox(
              height: 50,
            ),
            Text(
              "Add Owner to System",
              style: AppStyle.styleBold25(context).copyWith(
                  fontSize: 47,
                  fontFamily: 'Roboto',
                  color: MyColors.premiumColor),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Make sure to write the required information and all the",
              style: AppStyle.styleRegular17(context)
                  .copyWith(fontSize: 17, fontFamily: 'Roboto'),
            ),
            Text(
              " agreed-upon details , Please enter Valid Email ",
              style: AppStyle.styleRegular17(context).copyWith(
                fontSize: 17,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
                key: BlocProvider.of<AddOwnerCubit>(context).sendOtpKey,
                child: Column(
                  children: [
                    SizedBox(
                      width: 380,
                      child: TextFormField(
                        style: AppStyle.styleRegular16(context)
                            .copyWith(color: Colors.black),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        controller: BlocProvider.of<AddOwnerCubit>(context)
                            .emailController,
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
                      height: 20,
                    ),
                    SizedBox(
                      width: 380,
                      height: 47,
                      child: ElevatedButton(
                        onPressed: () {
                          if (!BlocProvider.of<AddOwnerCubit>(context)
                              .sendOtpKey
                              .currentState!
                              .validate()) {
                            return;
                          } else {
                            // showLoadingDialog(context);
                            BlocProvider.of<AddOwnerCubit>(context).sendCode();
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
                )),
          ],
        );
      },
    );
  }
}

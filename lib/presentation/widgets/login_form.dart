import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:admin_panel_app/core/logic/login_cubit/login_cubit.dart';
import 'package:admin_panel_app/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui_web' as ui_web;
import 'dart:html' as html;

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isVisable = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is LoginSuccessState) {
          String message = state.message;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(message),
            duration: const Duration(seconds: 5),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.only(bottom: 680, left: 160, right: 160),
          ));

          // html.window.history.pushState({}, '', '');
          // html.window.onPopState.listen((e) {
          //   html.window.history.pushState({}, '', '');
          // });

          // Navigator.pushReplacementNamed(context, dashBoardScreen);
          GoRouter.of(context).pushReplacementNamed(AppRouter.dashBoardScreen);
          // Navigator.pushAndRemoveUntil(
          //   context,
          //   MaterialPageRoute(builder: (context) => const DesktopDashboard()),
          //   (route) => false,
          // );
        }

        if (state is LoginErrorState) {
          String message = state.errMsg;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(message),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.only(bottom: 680, left: 160, right: 160),
          ));
        }
      },
      builder: (context, state) {
        return Form(
          key: BlocProvider.of<LoginCubit>(context).loginKey,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  child: TextFormField(
                    style: AppStyle.styleRegular16(context)
                        .copyWith(color: Colors.black),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    controller:
                        BlocProvider.of<LoginCubit>(context).signInEmail,
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
                      border: buildBorder(),
                    ),
                    validator: (email) {
                      if (email!.isEmpty) {
                        return "Please enter your email";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  child: TextFormField(
                    style: AppStyle.styleRegular16(context)
                        .copyWith(color: Colors.black),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    obscureText: isVisable,
                    controller:
                        BlocProvider.of<LoginCubit>(context).signInpassword,
                    decoration: InputDecoration(
                      errorStyle: AppStyle.styleRegular16(context)
                          .copyWith(color: Colors.red),
                      prefixIcon: const Icon(
                        Icons.lock_outlined,
                        color: Colors.black,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisable = !isVisable;
                          });
                        },
                        icon: isVisable
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      ),
                      labelText: "Password",
                      labelStyle: AppStyle.styleRegular16(context),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            width: 2, color: MyColors.premiumColor),
                      ),
                      floatingLabelStyle: AppStyle.styleRegular16(context)
                          .copyWith(
                              color: MyColors.premiumColor,
                              fontWeight: FontWeight.w600),
                      contentPadding: const EdgeInsets.all(8),
                      // enabledBorder: buildBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            width: 2, color: MyColors.premiumColor),
                      ),
                      border: buildBorder(),
                    ),
                    validator: (password) {
                      if (password!.isEmpty) {
                        return "Please enter your password";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 47,
                child: ElevatedButton(
                  onPressed: () {
                    if (!BlocProvider.of<LoginCubit>(context)
                        .loginKey
                        .currentState!
                        .validate()) {
                      return;
                    } else {
                      BlocProvider.of<LoginCubit>(context).login();
                      // Navigator.pushReplacementNamed(context, dashBoardScreen);
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
                    "Log In",
                    style: AppStyle.styleSemiBold18(context),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1, color: Colors.white),
    );
  }
}

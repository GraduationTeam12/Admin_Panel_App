import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isVisable = true;

  @override
  Widget build(BuildContext context) {
    return Form(
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
                style: AppStyle.styleRegular16(context).copyWith(color: Colors.black),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                controller: emailController,
                decoration: InputDecoration(
                  errorStyle: AppStyle.styleRegular16(context).copyWith(color: Colors.red),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.black,
                  ),
                  labelText: "E-mail",
                  labelStyle: AppStyle.styleRegular16(context),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(width: 2, color: MyColors.premiumColor),
                  ),
                  floatingLabelStyle: AppStyle.styleRegular16(context).copyWith(
                    color: MyColors.premiumColor,
                    fontWeight: FontWeight.w600,
                  ),
                  contentPadding: const EdgeInsets.all(8),
                  // enabledBorder: buildBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(width: 2, color: MyColors.premiumColor),
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
                style: AppStyle.styleRegular16(context).copyWith(color: Colors.black),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                obscureText: isVisable,
                controller: passwordController,
                decoration: InputDecoration(
                  errorStyle: AppStyle.styleRegular16(context).copyWith(color: Colors.red),
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
                    icon: isVisable ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                  ),
                  labelText: "Password",
                  labelStyle: AppStyle.styleRegular16(context),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(width: 2, color: MyColors.premiumColor),
                  ),
                  floatingLabelStyle: AppStyle.styleRegular16(context).copyWith(
                    color: MyColors.premiumColor, fontWeight: FontWeight.w600),
                  contentPadding: const EdgeInsets.all(8),
                  // enabledBorder: buildBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(width: 2, color: MyColors.premiumColor),
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
              onPressed: () {},
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
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1 , color: Colors.white),
    );
  }
}

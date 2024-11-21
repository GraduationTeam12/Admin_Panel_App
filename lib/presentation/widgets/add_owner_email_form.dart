import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:admin_panel_app/constants/pages_name.dart';
import 'package:admin_panel_app/presentation/widgets/add_owner_bar.dart';
import 'package:flutter/material.dart';

class AddOwnerEmailForm extends StatefulWidget {
  const AddOwnerEmailForm({
    super.key,
  });

  @override
  State<AddOwnerEmailForm> createState() => _AddOwnerEmailFormState();
}

class _AddOwnerEmailFormState extends State<AddOwnerEmailForm> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddOwnerBar(index: index),
        const SizedBox(
          height: 50,
        ),
        Text(
          "Add Owner to System",
          style: AppStyle.styleBold25(context).copyWith(
              fontSize: 47, fontFamily: 'Roboto', color: MyColors.premiumColor),
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
            child:
             Column(
          children: [
            SizedBox(
              width: 380,
              child: TextFormField(
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
                  labelText: "E-mail",
                  labelStyle: AppStyle.styleRegular16(context),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        width: 2, color: MyColors.premiumColor),
                  ),
                  floatingLabelStyle: AppStyle.styleRegular16(context).copyWith(
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
                    borderSide: const BorderSide(width: 1, color: Colors.white),
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
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 380,
              height: 47,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    index == 0 ? index++ : null;

                    Navigator.pushReplacementNamed(context, otpOwnerScreen);
                  });
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
        )),
      ],
    );
  }
}

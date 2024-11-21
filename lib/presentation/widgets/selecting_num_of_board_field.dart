import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:admin_panel_app/constants/pages_name.dart';
import 'package:admin_panel_app/core/logic/navigation_cubit/navigation_cubit.dart';
import 'package:admin_panel_app/presentation/widgets/add_owner_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectingNumOfBoardField extends StatefulWidget {
  const SelectingNumOfBoardField({super.key});

  @override
  State<SelectingNumOfBoardField> createState() => _SelectingNumOfBoardFieldState();
}

class _SelectingNumOfBoardFieldState extends State<SelectingNumOfBoardField> {

  int index = 3;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddOwnerBar(index: index),

        const SizedBox(
          height: 50,
        ),

          Text(
          "Select Number of Board",
          style: AppStyle.styleBold25(context).copyWith(
              fontSize: 40, fontFamily: 'Roboto', color: MyColors.premiumColor),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Please select the board number and complete the",
          style: AppStyle.styleRegular17(context)
              .copyWith(fontSize: 17, fontFamily: 'Roboto'),
        ),
        Text(
          " required information ",
          style: AppStyle.styleRegular17(context).copyWith(
            fontSize: 17,
            fontFamily: 'Roboto',
          ),
        ),
        const SizedBox(
          height: 20,
        ),

        Form(child: Column(
          children: [
            SizedBox(
              width: 380,
              child: TextFormField(
                style: AppStyle.styleRegular16(context)
                    .copyWith(color: Colors.black),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                // controller:
                //     BlocProvider.of<LoginCubit>(context).signInEmail,
                decoration: InputDecoration(
                  errorStyle: AppStyle.styleRegular16(context)
                      .copyWith(color: Colors.red),
                  prefixIcon: const Icon(
                    Icons.credit_card_outlined,
                    color: Colors.black,
                  ),
                  labelText: "Board Number",
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
                validator: (boardNum) {
                  if (boardNum!.isEmpty) {
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

                  context.read<NavigationCubit>().navigateTo(10);
                  // setState(() {
                  //   index == 3 ? index++ : null;

                  //    Navigator.pushReplacementNamed(context, confirmOwnerScreen);
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
import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_and_hospital_cubit.dart';
import 'package:admin_panel_app/presentation/widgets/add_owner_bar.dart';
import 'package:admin_panel_app/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SelectingNumOfBoardField extends StatefulWidget {
  const SelectingNumOfBoardField({super.key});

  @override
  State<SelectingNumOfBoardField> createState() =>
      SelectingNumOfBoardFieldState();
}

class SelectingNumOfBoardFieldState extends State<SelectingNumOfBoardField> {
  GlobalKey<FormState> formKey = GlobalKey();
  static late String boardNumber;
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
                  fontSize: MediaQuery.sizeOf(context).width < 800? 27 : 40,
                  fontFamily: 'Roboto',
                  color: MyColors.premiumColor),
            ),
            const SizedBox(
              height: 8,
            ),
            FittedBox(
              child: Text(
                "Please select the board number and complete the",
                style: AppStyle.styleRegular17(context)
                    .copyWith(fontSize: 17, fontFamily: 'Roboto'),
              ),
            ),
            Text(
              " required information ",
              style: AppStyle.styleRegular17(context).copyWith(
                fontSize: MediaQuery.sizeOf(context).width < 800 ? 15 : 17,
                fontFamily: 'Roboto',
              ),
            ),
              SizedBox(
              height: MediaQuery.sizeOf(context).width < 800 ? 80 :  20,
            ),
            Form(
                key: formKey,
                //  BlocProvider.of<AddOwnerCubit>(context).getUserInfoKey,
                child: Column(
                  children: [
                    SizedBox(
                      width: 380,
                      child: TextFormField(
                        style: AppStyle.styleRegular16(context)
                            .copyWith(color: Colors.black),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        controller: BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                            .boardIdController,
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
                        validator: (boardNum) {
                          if (boardNum!.isEmpty) {
                            return "Please enter the number of board";
                          }else if (boardNum.length != 12) {
                            return "Board ID must be exactly 12 characters";
                          }
                          return null;
                        },

                        onSaved: (value) {
                          boardNumber = value!;
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
                          if (!formKey.currentState!.validate()) {
                            return;
                          } else {
                            // BlocProvider.of<AddOwnerCubit>(context)
                            //     .getUserData();

                            // context.read<NavigationCubit>().navigateTo(9);
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmingInfo()));
                              GoRouter.of(context).pushReplacementNamed(AppRouter.confirmingInfo);
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
          ],
        );
      
  }
}

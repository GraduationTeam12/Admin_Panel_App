import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:admin_panel_app/presentation/widgets/add_owner_bar.dart';
import 'package:admin_panel_app/presentation/widgets/custom_container.dart';
import 'package:admin_panel_app/presentation/widgets/dialog_owner.dart';
import 'package:flutter/material.dart';

class ConfirmingInfo extends StatelessWidget {
  const ConfirmingInfo({super.key});

  final int index = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          //  Container(
          //   color: const Color.fromARGB(255, 232, 226, 226),
          //   child: CustomScrollView(
          //     slivers: [
          //       SliverToBoxAdapter(
          //         child: Column(
          //           children: [
          //             Container(
          //               width: double.infinity,
          //               decoration: const ShapeDecoration(
          //                   shape: RoundedRectangleBorder(),
          //                   color: Colors.white,
          //                   shadows: [
          //                     BoxShadow(
          //                       color: Color(0x3F000000),
          //                       spreadRadius: 0,
          //                       offset: Offset(0, 4),
          //                       blurRadius: 4,
          //                     )
          //                   ]),
          //               child: Text(
          //                 "   Owner",
          //                 style: AppStyle.styleSemiBold25(context)
          //                     .copyWith(fontSize: 35, color: Colors.black),
          //               ),
          //             ),
          //             const SizedBox(
          //               height: 30,
          //             ),
          Container(
            color: const Color.fromARGB(255, 232, 226, 226),
            child: CustomContainer(
                    child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: CustomScrollView(
              slivers: [SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AddOwnerBar(index: index),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Confirm The Information",
                      style: AppStyle.styleBold25(context).copyWith(
                          fontSize: 37,
                          fontFamily: 'Roboto',
                          color: MyColors.premiumColor),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      width: 380,
                      height: 47,
                      child: ElevatedButton(
                        onPressed: () {
                          showOwnerFormDialog(context);
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
                ),
              ),
            ]),
                    ),
                  ),
          ),
    );
  }
}

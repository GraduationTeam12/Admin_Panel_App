import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/presentation/widgets/custom_container.dart';
import 'package:admin_panel_app/presentation/widgets/otp_form.dart';
import 'package:flutter/material.dart';

class DesktopOtpOwner extends StatelessWidget {
  const DesktopOtpOwner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:

            // Container(
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
              child: const CustomContainer(
                    child: Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: CustomScrollView(
                        slivers: [SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OtpForm(),
                  SizedBox(
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

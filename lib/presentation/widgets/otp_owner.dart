import 'package:admin_panel_app/presentation/widgets/custom_container.dart';
import 'package:admin_panel_app/presentation/widgets/otp_form.dart';
import 'package:flutter/material.dart';

class OtpOwner extends StatelessWidget {
  const OtpOwner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color.fromARGB(255, 232, 226, 226),
      child: const CustomContainer(
        child: Padding(
          padding: EdgeInsets.only(top: 50),
          child: CustomScrollView(slivers: [
            SliverToBoxAdapter(
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

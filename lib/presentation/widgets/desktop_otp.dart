import 'package:admin_panel_app/presentation/widgets/custom_drawer.dart';
import 'package:admin_panel_app/presentation/widgets/desktop_otp_owner.dart';
import 'package:flutter/material.dart';

class DesktopOtp extends StatelessWidget {
  const DesktopOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(

      children:  [
          Expanded(
            flex: 1,
            child: CustomDrawer()),

            Expanded(
               flex: 4,
               child: DesktopOtpOwner())

      ],
    );
  }
}
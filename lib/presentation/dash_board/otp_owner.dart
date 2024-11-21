import 'package:admin_panel_app/presentation/widgets/adaptive_layout.dart';
import 'package:admin_panel_app/presentation/widgets/desktop_otp.dart';
import 'package:admin_panel_app/presentation/widgets/mobile_otp.dart';
import 'package:admin_panel_app/presentation/widgets/tablet_otp.dart';
import 'package:flutter/material.dart';

class OtpOwner extends StatefulWidget {
  const OtpOwner({super.key});

  @override
  State<OtpOwner> createState() => _OtpOwnerState();
}

class _OtpOwnerState extends State<OtpOwner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FA),
      
      body: AdaptiveLayout(
          mobileLayout: (context) => const MobileOtp(),
          tabletLayout: (context) => const TabletOtp(),
          desktopLayout: (context) => const DesktopOtp()),
    );
  }
}
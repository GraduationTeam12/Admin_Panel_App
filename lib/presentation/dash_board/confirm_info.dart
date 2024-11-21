import 'package:admin_panel_app/presentation/widgets/adaptive_layout.dart';
import 'package:admin_panel_app/presentation/widgets/desktop_confirm_info.dart';
import 'package:admin_panel_app/presentation/widgets/mobile_confirm_info.dart';
import 'package:admin_panel_app/presentation/widgets/tablet_confirm_info.dart';
import 'package:flutter/material.dart';

class ConfirmInfo extends StatelessWidget {
  const ConfirmInfo({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: const Color(0xFFF7F9FA),
      
      body: AdaptiveLayout(
          mobileLayout: (context) => const MobileConfirmInfo(),
          tabletLayout: (context) => const TabletConfirmInfo(),
          desktopLayout: (context) => const DesktopConfirmInfo()),
    );
  }
}
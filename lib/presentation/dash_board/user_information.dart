import 'package:admin_panel_app/presentation/widgets/adaptive_layout.dart';
import 'package:admin_panel_app/presentation/widgets/desktop_information.dart';
import 'package:admin_panel_app/presentation/widgets/mobile_information.dart';
import 'package:admin_panel_app/presentation/widgets/tablet_inforamtion.dart';
import 'package:flutter/material.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FA),
      
      body: AdaptiveLayout(
          mobileLayout: (context) => const MobileInformation(),
          tabletLayout: (context) => const TabletInforamtion(),
          desktopLayout: (context) => const DesktopInformation()),
    );
  }
}
import 'package:admin_panel_app/presentation/widgets/adaptive_layout.dart';
import 'package:admin_panel_app/presentation/widgets/desktop_add_owner.dart';
import 'package:admin_panel_app/presentation/widgets/mobile_add_owner.dart';
import 'package:admin_panel_app/presentation/widgets/tablet_add_owner.dart';
import 'package:flutter/material.dart';

class AddOwner extends StatefulWidget {
  const AddOwner({super.key});

  @override
  State<AddOwner> createState() => _AddOwnerState();
}

class _AddOwnerState extends State<AddOwner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FA),
      
      body: AdaptiveLayout(
          mobileLayout: (context) => const MobileAddOwner(),
          tabletLayout: (context) => const TabletAddOwner(),
          desktopLayout: (context) => const DesktopAddOwner()),
    );
  }
}

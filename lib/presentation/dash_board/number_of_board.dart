import 'package:admin_panel_app/presentation/widgets/adaptive_layout.dart';
import 'package:admin_panel_app/presentation/widgets/desktop_select_num_of_board.dart';
import 'package:admin_panel_app/presentation/widgets/mobile_select_num_of_board.dart';
import 'package:admin_panel_app/presentation/widgets/tablet_select_num_of_board.dart';
import 'package:flutter/material.dart';

class NumberOfBoard extends StatelessWidget {
  const NumberOfBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FA),
      
      body: AdaptiveLayout(
          mobileLayout: (context) => const MobileSelectNumOfBoard(),
          tabletLayout: (context) => const TabletSelectNumOfBoard(),
          desktopLayout: (context) => const DesktopSelectNumOfBoard()),
    );
  }
}
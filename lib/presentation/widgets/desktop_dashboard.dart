import 'package:admin_panel_app/presentation/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class DesktopDashboard extends StatelessWidget {
  const DesktopDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        const Expanded(
          flex: 1,
          child: CustomDrawer()),

        Expanded(
          flex: 4,
          child: Container(
          color: Colors.red,
        ))
      ],
    );
  }
}
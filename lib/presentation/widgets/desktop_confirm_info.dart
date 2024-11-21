import 'package:admin_panel_app/presentation/widgets/confirming_info.dart';
import 'package:admin_panel_app/presentation/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class DesktopConfirmInfo extends StatelessWidget {
  const DesktopConfirmInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(

      children:  [
          Expanded(
            flex: 1,
            child: CustomDrawer()),

            Expanded(
               flex: 4,
               child:  ConfirmingInfo())

      ],
    );
  }
}
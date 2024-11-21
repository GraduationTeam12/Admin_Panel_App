import 'package:admin_panel_app/presentation/widgets/custom_drawer.dart';
import 'package:admin_panel_app/presentation/widgets/get_information_body.dart';
import 'package:flutter/material.dart';

class DesktopInformation extends StatelessWidget {
  const DesktopInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(

      children:  [
          Expanded(
            flex: 1,
            child: CustomDrawer()),

            Expanded(
               flex: 4,
               child: GetInformationBody())

      ],
    );
  }
}
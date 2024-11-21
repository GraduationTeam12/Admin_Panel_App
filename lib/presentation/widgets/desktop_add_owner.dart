// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:admin_panel_app/presentation/widgets/add_owner_body.dart';
import 'package:admin_panel_app/presentation/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class DesktopAddOwner extends StatelessWidget {
  const DesktopAddOwner({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(

      children:  [
          // Expanded(
          //   flex: 1,
          //   child: CustomDrawer()),

            Expanded(
               flex: 4,
               child: AddOwnerBody())

      ],
    );
  }
}
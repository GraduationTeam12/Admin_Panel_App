import 'package:admin_panel_app/presentation/widgets/custom_drawer.dart';
import 'package:admin_panel_app/presentation/widgets/selecting_num_of_board.dart';
import 'package:flutter/material.dart';

class DesktopSelectNumOfBoard extends StatelessWidget {
  const DesktopSelectNumOfBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(flex: 1, child: CustomDrawer()),
        Expanded(flex: 4, child: SelectingNumOfBoard())
      ],
    );
  }
}

import 'package:admin_panel_app/presentation/models/drawer_item_model.dart';
import 'package:admin_panel_app/presentation/widgets/drawer_active_and_inactive.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {super.key, required this.drawerItemModel, required this.isActive});
  final DrawerItemModel drawerItemModel;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? ActiveDarwerItem(drawerItemModel: drawerItemModel)
        : InActiveDarwerItem(drawerItemModel: drawerItemModel);
  }
}
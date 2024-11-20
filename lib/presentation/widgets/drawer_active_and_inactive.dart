import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:admin_panel_app/presentation/models/drawer_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InActiveDarwerItem extends StatelessWidget {
  const InActiveDarwerItem({
    super.key,
    required this.drawerItemModel,
  });

  final DrawerItemModel drawerItemModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(drawerItemModel.image),
      title: FittedBox(
        alignment: AlignmentDirectional.centerStart,
        fit: BoxFit.scaleDown,
        child: Text(
          drawerItemModel.title,
          style: AppStyle.styleRegular25(context),
        ),
      ),
    );
  }
}

class ActiveDarwerItem extends StatelessWidget {
  const ActiveDarwerItem({
    super.key,
    required this.drawerItemModel,
  });

  final DrawerItemModel drawerItemModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
        
          width: 200,
          decoration: const ShapeDecoration(
                color: Colors.amber,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
              ),
          child: ListTile(
            leading: SvgPicture.asset(drawerItemModel.image),
            title: FittedBox(
              alignment: AlignmentDirectional.centerStart,
              fit: BoxFit.scaleDown,
              child: Text(
                drawerItemModel.title,
                style: AppStyle.styleRegular25(context)
              ),
            ),
            // trailing: Container(
            //   width: 3,
            //   clipBehavior: Clip.hardEdge,
            //   decoration: const BoxDecoration(
            //     color: MyColors.premiumColor,
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
import 'package:admin_panel_app/constants/app_images.dart';
import 'package:admin_panel_app/presentation/models/drawer_item_model.dart';
import 'package:admin_panel_app/presentation/widgets/drawer.dart';
import 'package:admin_panel_app/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerItemListview extends StatefulWidget {
  DrawerItemListview(
      {super.key,
      required this.activeIndex,
      required this.onTap,
      this.isOwner});

  int activeIndex;
  final String? isOwner;
  final Function(int) onTap;
  @override
  State<DrawerItemListview> createState() => _DrawerItemListviewState();
}

class _DrawerItemListviewState extends State<DrawerItemListview> {
  // late int activeIndex = widget.activeIndex;
  // int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<DrawerItemModel> items = [
      DrawerItemModel(
          title: "Overview",
          image: Assets.imagesAuthImagesOverviewDrawer,
          imageActive: Assets.imagesAuthImagesHomeW,
          onTap: () {
            GoRouter.of(context).goNamed(AppRouter.dashBoardScreen);
          }),
          DrawerItemModel(
          title: "Danger Zones",
          image: Assets.imagesAuthImagesIconDangerZonesNotActive,
          imageActive: Assets.imagesAuthImagesIconDangerZonesActive,
          onTap: () {
            GoRouter.of(context).goNamed(AppRouter.dangerZones);
          }),
      DrawerItemModel(
          title: "Reports",
          image: Assets.imagesAuthImagesReportsDrawer,
          imageActive: Assets.imagesAuthImagesReportW,
          onTap: () {
            widget.isOwner == null
                ? GoRouter.of(context).goNamed(AppRouter.ownerReports)
                : GoRouter.of(context).goNamed(AppRouter.hospitalReports);
          }),
      DrawerItemModel(
          title: "Support",
          image: Assets.imagesAuthImagesSupportDrawer,
          imageActive: Assets.imagesAuthImagesSupportW,
          onTap: () {
            GoRouter.of(context).goNamed(AppRouter.support);
          })
    ];
    return SliverList.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: InkWell(
              onTap: () {
                items[index].onTap();
                // setState(() {
                //   if (widget.activeIndex != index) {
                //     widget.activeIndex = index;
                    
                //   }
                // });
              },
              child: DrawerItem(
                  drawerItemModel: items[index],
                  isActive: widget.activeIndex == index),
            ),
          );
        });
  }
}

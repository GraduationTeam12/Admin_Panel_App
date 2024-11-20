import 'package:admin_panel_app/constants/app_images.dart';
import 'package:admin_panel_app/core/logic/navigation_cubit/navigation_cubit.dart';
import 'package:admin_panel_app/presentation/models/drawer_item_model.dart';
import 'package:admin_panel_app/presentation/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerItemListview extends StatefulWidget {
  const DrawerItemListview({super.key});

  @override
  State<DrawerItemListview> createState() => _DrawerItemListviewState();
}

class _DrawerItemListviewState extends State<DrawerItemListview> {
  final List<DrawerItemModel> items = [
    const DrawerItemModel(
        title: "Overview", image: Assets.imagesAuthImagesOverviewDrawer),
    const DrawerItemModel(
        title: "Reports", image: Assets.imagesAuthImagesReportsDrawer),
    const DrawerItemModel(
        title: "Notification",
        image: Assets.imagesAuthImagesNotificationDrawer),
    const DrawerItemModel(
        title: "Support", image: Assets.imagesAuthImagesSupportDrawer)
  ];

  // int activeIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return SliverList.builder(
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.only(top: 20),
//             child: GestureDetector(
//               onTap: () {
//                 if (activeIndex != index) {
//                   setState(() {
//                     activeIndex = index;
//                     context.read<NavigationCubit>().navigateTo(activeIndex);
//                   });
//                 }
//               },
//               child: DrawerItem(drawerItemModel: items[index], isActive: activeIndex == index),
//             ),
//           );
//         });
//   }
// }

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<NavigationCubit, int>(
              builder: (context, pageIndex) {
                return SliverList.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                             return Padding(
                                 padding: const EdgeInsets.only(top: 20),
                                 child: GestureDetector(
                                    onTap: () {
                
                                     setState(() {
                                        context.read<NavigationCubit>().navigateTo(index);
                                      });
                
                                   },
                                    child: DrawerItem(drawerItemModel: items[index], isActive: pageIndex == index),
                                 ),
                                   );
                              });
  
              },
            );
  }
}

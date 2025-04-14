// ignore_for_file: must_be_immutable

import 'dart:developer';
import 'package:admin_panel_app/presentation/dash_board/overview.dart';
import 'package:admin_panel_app/presentation/widgets/custom_drawer.dart';
import 'package:admin_panel_app/presentation/widgets/header_desktop.dart';
import 'package:flutter/material.dart';

class DesktopDashboard extends StatelessWidget {
    const DesktopDashboard({
    super.key,
    this.widget,
  });

  final Widget? widget;

  // final List<String> _pagesTitle = [
  //   "Overview",
  //   'Reports',
  //   "Support",
  //   // "Survey",
  //   // "Add Owner",
  //   // "Add hospital",
  //   // "Add Owner",
  //   // "Add Owner",
  //   // "Add Owner",
  //   // "Add Owner",
  //   // 'Reports',
  //   // 'Reports',
  //   // "Owner Information"
  // ];

  // final List<String> _pageRoutes = [
  //   '/dashboard/Overview',
  //   '/dashboard/Reports',
  //   '/dashboard/Support',
  // ];

  // final List<Widget> _pageWidget = [
  @override
  Widget build(BuildContext context) {
      
    return Scaffold(
      backgroundColor: const Color.fromRGBO(217, 217, 217, 0.7),
      body: Row(
        children: [
          Expanded(
              flex: 1,
              child: CustomDrawer(
                  activeIndex: 0,
                  onTap: (index) {
                    log(index.toString());
                    // if (activeIndex != index) {
                    //   setState(() {
                    //     activeIndex = index;
                    //   });
                    // }
                  })),
          Expanded(
              flex: 4,
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: CustomScrollView(slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const HeaderDesktop(
                          title:
                              'Overview'
                              // _pagesTitle[activeIndex],
                        ),
                        Container(
                          height: MediaQuery.sizeOf(context).height -
                              MediaQuery.sizeOf(context).height * .11,
                          width: MediaQuery.of(context).size.width,
                          color: const Color.fromRGBO(217, 217, 217, 0.7),
                          child: const Overview(),
                        )
                      ],
                    ),
                  ),
                ]),
              ))
        ],
      ),
    );
  }
}

import 'package:admin_panel_app/presentation/widgets/adaptive_layout.dart';
import 'package:admin_panel_app/presentation/widgets/desktop_dashboard.dart';
import 'package:admin_panel_app/presentation/widgets/mobile_widgets/mobile_dash_board.dart';
import 'package:admin_panel_app/presentation/widgets/tablet_widgets/tablet_dash_board.dart';
import 'package:flutter/material.dart';
 

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  //  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   key: scaffoldKey,
      // appBar: MediaQuery.of(context).size.width < 800
      //     ? AppBar(
      //         elevation: 0,
      //         backgroundColor: Colors.white,
      //         shadowColor: Colors.white,
      //         surfaceTintColor: Colors.white,
      //         title: const HeaderDesktop(title: ''),
      //         leading: IconButton(
      //             onPressed: () {
      //               scaffoldKey.currentState!.openDrawer();
      //             },
      //             icon: const Icon(Icons.menu , size: 35,)),
      //       )
      //     : null,
      // drawer: MediaQuery.of(context).size.width < 800 ? const CustomDrawer() : null,
      backgroundColor: const Color(0xFFF7F9FA),
      body: AdaptiveLayout(
          mobileLayout: (context) =>   const MobileDashBoard(),
          tabletLayout: (context) =>  const TabletDashBoard(),
          desktopLayout: (context) =>     const DesktopDashboard()),
    );
  }
}

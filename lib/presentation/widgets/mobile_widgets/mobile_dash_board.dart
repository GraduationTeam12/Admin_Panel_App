import 'package:admin_panel_app/constants/app_images.dart';
import 'package:admin_panel_app/presentation/dash_board/overview.dart';

import 'package:admin_panel_app/presentation/widgets/custom_drawer.dart';
import 'package:admin_panel_app/presentation/widgets/header_desktop.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MobileDashBoard extends StatefulWidget {
  const MobileDashBoard({super.key, this.widget});

  final Widget? widget;

  @override
  State<MobileDashBoard> createState() => _MobileDashBoardState();
}

class _MobileDashBoardState extends State<MobileDashBoard> {
   

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: MediaQuery.of(context).size.width < 800
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              shadowColor: Colors.white,
              surfaceTintColor: Colors.white,
              title: const HeaderDesktop(title: ''),
              leading: IconButton(
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                  icon: SvgPicture.asset(
                    Assets.imagesAuthImagesMenu,
                    height: 25,
                  )),
            )
          : null,
      drawer: MediaQuery.of(context).size.width < 800
          ? CustomDrawer(
              activeIndex: 0,
              onTap: (index) {},
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
             
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
    );
  }
}

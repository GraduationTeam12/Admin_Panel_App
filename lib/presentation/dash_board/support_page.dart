import 'dart:developer';

import 'package:admin_panel_app/constants/app_images.dart';
import 'package:admin_panel_app/presentation/widgets/custom_drawer.dart';
import 'package:admin_panel_app/presentation/widgets/header_desktop.dart';
import 'package:admin_panel_app/presentation/widgets/selecting_readed_or_inreaded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SupportPage extends StatelessWidget {
    SupportPage({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return 
    MediaQuery.sizeOf(context).width < 1201 ? 
    Scaffold(
      key: scaffoldKey,
      appBar: MediaQuery.of(context).size.width < 1201
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
      drawer: MediaQuery.of(context).size.width < 1201
          ? CustomDrawer(
              activeIndex: 3,
              onTap: (index) {},
            )
          : null,
      body: const SelectingReadedOrInreaded(),
    )
     :
    Scaffold(
      backgroundColor: const Color.fromRGBO(217, 217, 217, 0.7),
      body: Row(
        children: [
          Expanded(
              flex: 1,
              child: CustomDrawer(
                  activeIndex: 3,
                  onTap: (index) {
                    log(index.toString());
                    // if (activeIndex != index) {
                    //   setState(() {
                    //     activeIndex = index;
                    //   });
                    // }
                  })),
          const Expanded(
            flex: 4,
            child: Scaffold(
              backgroundColor:  Color.fromRGBO(217, 217, 217, 0.7),
              appBar: PreferredSize(
              preferredSize: Size.fromHeight(60), 
              child:  HeaderDesktop(title: 'Support'),
            ),
             body: SelectingReadedOrInreaded()),
          ),
        ],
      ),
    );
  }
}

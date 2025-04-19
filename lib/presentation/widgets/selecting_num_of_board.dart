import 'dart:developer';

import 'package:admin_panel_app/constants/app_images.dart';
import 'package:admin_panel_app/presentation/widgets/custom_container.dart';
import 'package:admin_panel_app/presentation/widgets/custom_drawer.dart';
import 'package:admin_panel_app/presentation/widgets/header_desktop.dart';
import 'package:admin_panel_app/presentation/widgets/selecting_num_of_board_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectingNumOfBoard extends StatelessWidget {
    SelectingNumOfBoard({super.key});

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
              activeIndex: 4,
              onTap: (index) {},
            )
          : null,

          body: Container(
              color: const Color.fromARGB(255, 232, 226, 226),
              child: const CustomContainer(
                child: Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: CustomScrollView(slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SelectingNumOfBoardField(),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
    )
    :
    
     Scaffold(
      body: Row(
        children: [
          Expanded(
              flex: 1,
              child: CustomDrawer(
                  activeIndex: 4,
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
            child: Scaffold(
                appBar:const PreferredSize(
              preferredSize: Size.fromHeight(60), 
              child:  HeaderDesktop(title: 'Add Owner'),
            ),
              body: Container(
                padding: MediaQuery.sizeOf(context).height<660?EdgeInsets.fromLTRB(0, 15, 0, 15):EdgeInsets.fromLTRB(0, 15, 0, 15),
                color: const Color.fromARGB(255, 232, 226, 226),
                child: const CustomContainer(
                  child: Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: CustomScrollView(slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SelectingNumOfBoardField(),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

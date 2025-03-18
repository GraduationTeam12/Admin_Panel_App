// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:developer';

import 'package:admin_panel_app/constants/app_images.dart';
import 'package:admin_panel_app/presentation/widgets/add_owner_email_form.dart';
import 'package:admin_panel_app/presentation/widgets/custom_container.dart';
import 'package:admin_panel_app/presentation/widgets/custom_drawer.dart';
import 'package:admin_panel_app/presentation/widgets/header_desktop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddOwner extends StatelessWidget {
    AddOwner({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return 
    MediaQuery.sizeOf(context).width < 1201 ? 
    Scaffold(
      key: scaffoldKey,
      drawer: MediaQuery.of(context).size.width < 1201
          ? CustomDrawer(
              activeIndex: 4,
              onTap: (index) {},
            )
          : null,
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
          body: Container(
            color: const Color.fromARGB(255, 232, 226, 226),
            child: const CustomContainer(
              child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // const AddOwnerBar(),

                          AddOwnerEmailForm(),

                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
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
          child: Container(
            color: const Color.fromARGB(255, 232, 226, 226),
            child: const CustomContainer(
              child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // const AddOwnerBar(),

                          AddOwnerEmailForm(),

                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

import 'dart:developer';

import 'package:admin_panel_app/constants/app_images.dart';
import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:admin_panel_app/presentation/widgets/add_owner_bar.dart';
import 'package:admin_panel_app/presentation/widgets/custom_container.dart';
import 'package:admin_panel_app/presentation/widgets/custom_drawer.dart';
import 'package:admin_panel_app/presentation/widgets/dialog_owner.dart';
import 'package:admin_panel_app/presentation/widgets/header_desktop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ConfirmingInfo extends StatelessWidget {
    ConfirmingInfo({super.key});

  final int index = 4;
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
                  child: CustomContainer(
                          child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: CustomScrollView(
                    slivers: [SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        
                          FittedBox(
                            child: Text(
                              "Confirm The Information",
                              style: AppStyle.styleBold25(context).copyWith(
                                  fontSize: 37,
                                  fontFamily: 'Roboto',
                                  color: MyColors.premiumColor),
                            ),
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          SizedBox(
                            width: 380,
                            height: 47,
                            child: ElevatedButton(
                              onPressed: () {
                                showOwnerFormDialog(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyColors.premiumColor,
                                elevation: 6,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Text(
                                "Continue",
                                style: AppStyle.styleRegular25(context).copyWith(
                                    fontSize: 25, fontFamily: 'Inter', color: Colors.white),
                              ),
                            ),
                          ),
                        const SizedBox(
                            height: 50,
                          ),
                        AddOwnerBar(index: index),
                          
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
      body:
           
          Row(
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
                    child: CustomContainer(
                            child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: CustomScrollView(
                      slivers: [SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          
                            FittedBox(
                              child: Text(
                                "Confirm The Information",
                                style: AppStyle.styleBold25(context).copyWith(
                                    fontSize: 37,
                                    fontFamily: 'Roboto',
                                    color: MyColors.premiumColor),
                              ),
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                            SizedBox(
                              width: 380,
                              height: 47,
                              child: ElevatedButton(
                                onPressed: () {
                                  showOwnerFormDialog(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: MyColors.premiumColor,
                                  elevation: 6,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: Text(
                                  "Continue",
                                  style: AppStyle.styleRegular25(context).copyWith(
                                      fontSize: 25, fontFamily: 'Inter', color: Colors.white),
                                ),
                              ),
                            ),
                              const SizedBox(
                              height: 50,
                            ),
                              AddOwnerBar(index: index),
                          
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

import 'dart:developer';

import 'package:admin_panel_app/constants/app_images.dart';
import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:admin_panel_app/presentation/widgets/custom_drawer.dart';
import 'package:admin_panel_app/presentation/widgets/header_desktop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SurveyPage extends StatelessWidget {
    SurveyPage({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MediaQuery.sizeOf(context).width < 1201 ? 
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
              padding: MediaQuery.sizeOf(context).width < 800
                  ? const EdgeInsets.symmetric(horizontal: 20)
                  : const EdgeInsets.symmetric(horizontal: 150),
              child: CustomScrollView(slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      // SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
                      SizedBox(
                        // height:  MediaQuery.sizeOf(context).height*0.20,
                        child: MediaQuery.sizeOf(context).width < 800
                            ? Center(
                                child: Column(
                                  children: [
                                    Text(
                                      'You have the authority as an',
                                      style: AppStyle.styleRegular35(context),
                                    ),
            
                                    FittedBox(child: Text('admin to create and send' ,   style: AppStyle.styleRegular35(context),)),
            
                                    FittedBox(child: Text('a periodic survey to all' ,   style: AppStyle.styleRegular35(context),)),
            
                                    FittedBox(child: Text('customers to ensure their',   style: AppStyle.styleRegular35(context),)),
            
                                    FittedBox(child: Text(' satisfaction with our service',   style: AppStyle.styleRegular35(context),))
                                  ],
                                ),
                              )
                            : Column(
                                children: [
                                  FittedBox(
                                    child: Text(
                                      "You have the authority as an admin to create and send a periodic survey",
                                      style: AppStyle.styleRegular35(context),
                                      // TextStyle(
                                      // fontSize: 35,
                                      //   //  fontSize: 210*( MediaQuery.sizeOf(context).height*0.25)/MediaQuery.sizeOf(context).width,
                                      //    fontWeight: FontWeight.w400,
                                      //    color: Color.fromRGBO(61, 100, 152, 1)),
                                      //  textAlign: TextAlign.center,
                                    ),
                                  ),
                                  FittedBox(
                                    child: Text(
                                      "  survey to all customers to ensure their satisfaction with our service    ",
                                      style: AppStyle.styleRegular35(context),
                                      // TextStyle(
                                      // fontSize: 35,
                                      //   //  fontSize: 210*( MediaQuery.sizeOf(context).height*0.25)/MediaQuery.sizeOf(context).width,
                                      //    fontWeight: FontWeight.w400,
                                      //    color: Color.fromRGBO(61, 100, 152, 1)),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                      ),
            
                      SizedBox(
                          height: 300,
                          width: 300,
                          // height: MediaQuery.sizeOf(context).height*0.5,width: MediaQuery.sizeOf(context).width*0.3,
                          child: SvgPicture.asset(Assets.imagesAuthImagesBroSurvey)),
                      // SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                          height: 47,
                          width: 400,
                          // height: MediaQuery.sizeOf(context).height*0.08,
                          //   width: MediaQuery.sizeOf(context).width*0.3,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: MyColors.premiumColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Text(
                            "Get Now",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 22),
                          )),
                    ],
                  ),
                ),
              ]),
            ) ,
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
              padding: MediaQuery.sizeOf(context).width < 800
                  ? const EdgeInsets.symmetric(horizontal: 20)
                  : const EdgeInsets.symmetric(horizontal: 150),
              child: CustomScrollView(slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      // SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
                      SizedBox(
                        // height:  MediaQuery.sizeOf(context).height*0.20,
                        child: MediaQuery.sizeOf(context).width < 800
                            ? Center(
                                child: Column(
                                  children: [
                                    Text(
                                      'You have the authority as an',
                                      style: AppStyle.styleRegular35(context),
                                    ),
            
                                    FittedBox(child: Text('admin to create and send' ,   style: AppStyle.styleRegular35(context),)),
            
                                    FittedBox(child: Text('a periodic survey to all' ,   style: AppStyle.styleRegular35(context),)),
            
                                    FittedBox(child: Text('customers to ensure their',   style: AppStyle.styleRegular35(context),)),
            
                                    FittedBox(child: Text(' satisfaction with our service',   style: AppStyle.styleRegular35(context),))
                                  ],
                                ),
                              )
                            : Column(
                                children: [
                                  FittedBox(
                                    child: Text(
                                      "You have the authority as an admin to create and send a periodic survey",
                                      style: AppStyle.styleRegular35(context),
                                      // TextStyle(
                                      // fontSize: 35,
                                      //   //  fontSize: 210*( MediaQuery.sizeOf(context).height*0.25)/MediaQuery.sizeOf(context).width,
                                      //    fontWeight: FontWeight.w400,
                                      //    color: Color.fromRGBO(61, 100, 152, 1)),
                                      //  textAlign: TextAlign.center,
                                    ),
                                  ),
                                  FittedBox(
                                    child: Text(
                                      "  survey to all customers to ensure their satisfaction with our service    ",
                                      style: AppStyle.styleRegular35(context),
                                      // TextStyle(
                                      // fontSize: 35,
                                      //   //  fontSize: 210*( MediaQuery.sizeOf(context).height*0.25)/MediaQuery.sizeOf(context).width,
                                      //    fontWeight: FontWeight.w400,
                                      //    color: Color.fromRGBO(61, 100, 152, 1)),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                      ),
            
                      SizedBox(
                          height: 300,
                          width: 300,
                          // height: MediaQuery.sizeOf(context).height*0.5,width: MediaQuery.sizeOf(context).width*0.3,
                          child: SvgPicture.asset(Assets.imagesAuthImagesBroSurvey)),
                      // SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                          height: 47,
                          width: 400,
                          // height: MediaQuery.sizeOf(context).height*0.08,
                          //   width: MediaQuery.sizeOf(context).width*0.3,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: MyColors.premiumColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Text(
                            "Get Now",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 22),
                          )),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

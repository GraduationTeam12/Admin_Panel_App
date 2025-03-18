import 'package:admin_panel_app/constants/app_images.dart';
import 'package:admin_panel_app/presentation/widgets/custom_drawer.dart';

import 'package:admin_panel_app/presentation/widgets/tablet_widgets/tablet_overview.dart';
import 'package:admin_panel_app/presentation/widgets/tablet_widgets/widgets/admin_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TabletDashBoard extends StatefulWidget {
  const TabletDashBoard({super.key, this.widget});

  final Widget? widget;

  @override
  State<TabletDashBoard> createState() => _TabletDashBoardState();
}

class _TabletDashBoardState extends State<TabletDashBoard> {
  // final List<String> _pagesTitle = [
  //   "Overview",
  //   'Reports',
  //   "Support",
  //   "Survey",
  //   "Add Owner",
  //   "Add hospital",
  //   "Add Owner",
  //   "Add Owner",
  //   "Add Owner",
  //   "Add Owner",
  //   'Reports',
  //   'Reports',
  //   "Owner Information"
  // ];

  // final List<Widget> pageWidget = [
  //   const TabletOverview(),
  //   OwnerReportsMobile(),
  //   const SupportPage(),
  //   const SurveyPage(),
  //   const AddOwner(),
  //   const AddHospital(),
  //   const OtpOwner(),
  //   const UserInformation(),
  //   const SelectingNumOfBoard(),
  //   const ConfirmingInfo(),
  //   OwnerReportsMobile(),
  //   HospitalReportMobile(),
  //   // const ReportOwnerEditingInformation()
  // ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MediaQuery.of(context).size.width < 1201
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              shadowColor: Colors.white,
              surfaceTintColor: Colors.white,
              title: const Text(
                'Overview',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              leading: IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  icon: SvgPicture.asset(
                    Assets.imagesAuthImagesMenu,
                    height: 25,
                  )),
              actions: const [AdminInfo()],
            )
          : null,
      drawer: MediaQuery.of(context).size.width < 1200
          ?   CustomDrawer(activeIndex:  0,
          onTap: (index){},
          )
          : null,
      // bottomNavigationBar:   BottomAppBar(
      //         elevation: 0,
      //         color: Colors.white,
      //         shape: const CircularNotchedRectangle(),
      //         notchMargin: 4,
      //         child: SizedBox(
      //           height: 70,
      //           child: Row(
      //             mainAxisSize: MainAxisSize.max,
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               SizedBox(
      //                 height: 100,
      //                 width: 68,
      //                 child: InkWell(
      //                     onTap: () {
      //                       showOwnerChartDialog(context);
      //                     },
      //                     child: SvgPicture.asset(
      //                         Assets.imagesAuthImagesChartIcon)),
      //               )
      //             ],
      //           ),
      //         ),
      //       )
      //       BottomAppBar(
      //             elevation: 0,
      //             color: Colors.white,
      //             shape: const CircularNotchedRectangle(),
      //             notchMargin: 4,
      //             child: SizedBox(
      //               height: 70,
      //               child: Row(
      //                 mainAxisSize: MainAxisSize.max,
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   SizedBox(
      //                     height: 100,
      //                     width: 68,
      //                     child: InkWell(
      //                         onTap: () {
      //                           showHospitalChartDialog(context);
      //                         },
      //                         child: SvgPicture.asset(
      //                             Assets.imagesAuthImagesChartIcon)),
      //                   )
      //                 ],
      //               ),
      //             ),
      //           )
      //         : null,
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height -
                    MediaQuery.sizeOf(context).height * .11,
                width: MediaQuery.of(context).size.width,
                color: const Color.fromRGBO(217, 217, 217, 0.7),
                child:  const TabletOverview(),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

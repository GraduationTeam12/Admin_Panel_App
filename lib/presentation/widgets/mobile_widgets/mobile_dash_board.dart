import 'package:admin_panel_app/constants/app_images.dart';
import 'package:admin_panel_app/core/logic/navigation_cubit/navigation_cubit.dart';
import 'package:admin_panel_app/presentation/dash_board/overview.dart';
import 'package:admin_panel_app/presentation/dash_board/support_page.dart';
import 'package:admin_panel_app/presentation/widgets/add_hospital.dart';
import 'package:admin_panel_app/presentation/widgets/add_owner.dart';
import 'package:admin_panel_app/presentation/widgets/confirming_info.dart';
import 'package:admin_panel_app/presentation/widgets/custom_drawer.dart';
import 'package:admin_panel_app/presentation/widgets/header_desktop.dart';
import 'package:admin_panel_app/presentation/widgets/mobile_widgets/hospital_chart_dialog.dart';
import 'package:admin_panel_app/presentation/widgets/mobile_widgets/hospital_reports.dart';
import 'package:admin_panel_app/presentation/widgets/mobile_widgets/owner_chart_dialog.dart';
import 'package:admin_panel_app/presentation/widgets/mobile_widgets/reports_owner.dart';
import 'package:admin_panel_app/presentation/widgets/otp_owner.dart';
import 'package:admin_panel_app/presentation/widgets/selecting_num_of_board.dart';
import 'package:admin_panel_app/presentation/widgets/survey_page.dart';
import 'package:admin_panel_app/presentation/widgets/user_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MobileDashBoard extends StatefulWidget {
  const MobileDashBoard({super.key, this.widget});

  final Widget? widget;

  @override
  State<MobileDashBoard> createState() => _MobileDashBoardState();
}

class _MobileDashBoardState extends State<MobileDashBoard> {
  // final List<String> _pagesTitle = [
  final List<Widget> pageWidget = [
    const Overview(),
    OwnerReportsMobile(),
    const SupportPage(),
    const SurveyPage(),
    const AddOwner(),
    const AddHospital(),
    const OtpOwner(),
    const UserInformation(),
    const SelectingNumOfBoard(),
    const ConfirmingInfo(),
    OwnerReportsMobile(),
    HospitalReportMobile(),
    // const ReportOwnerEditingInformation()
  ];

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

   
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, pageIndex) {
        return Scaffold(
          bottomNavigationBar: pageIndex == 1 || pageIndex == 10
              ? BottomAppBar(
                  elevation: 0,
                  // height: 70,
                  color: Colors.white,
                  shape: const CircularNotchedRectangle(),
                  notchMargin: 4,
                  // clipBehavior: Clip.antiAliasWithSaveLayer,

                  child: SizedBox(
                    height: 70,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 68,
                          child: InkWell(
                              onTap: () {
                                showOwnerChartDialog(context);
                              },
                              child: SvgPicture.asset(
                                  Assets.imagesAuthImagesChartIcon)),
                        )
                      ],
                    ),
                  ),
                )
              : pageIndex == 11
                  ? BottomAppBar(
                      elevation: 0,
                      // height: 70,
                      color: Colors.white,
                      shape: const CircularNotchedRectangle(),
                      notchMargin: 4,
                      // clipBehavior: Clip.antiAliasWithSaveLayer,

                      child: SizedBox(
                        height: 70,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 68,
                              child: InkWell(
                                  onTap: () {
                                    showHospitalChartDialog(context);
                                  },
                                  child: SvgPicture.asset(
                                      Assets.imagesAuthImagesChartIcon)),
                            )
                          ],
                        ),
                      ),
                    )
                  : null,
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
              ? const CustomDrawer()
              : null,
          body: SingleChildScrollView(
            child: Column(
              children: [
               
                // HeaderDesktop(
                //   title: _pagesTitle[pageIndex],
                // ),
                Container(
                  height: MediaQuery.sizeOf(context).height -
                      MediaQuery.sizeOf(context).height * .11,
                  width: MediaQuery.of(context).size.width,
                  color: const Color.fromRGBO(217, 217, 217, 0.7),
                  child: widget.widget ?? pageWidget[pageIndex],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:admin_panel_app/constants/app_images.dart';
import 'package:admin_panel_app/presentation/models/report_model.dart';
import 'package:admin_panel_app/presentation/widgets/custom_drawer.dart';
import 'package:admin_panel_app/presentation/widgets/header_desktop.dart';
import 'package:admin_panel_app/presentation/widgets/mobile_widgets/owner_chart_dialog.dart';
import 'package:admin_panel_app/presentation/widgets/mobile_widgets/owner_reports.dart';
import 'package:admin_panel_app/presentation/widgets/report_owner_bar.dart';
import 'package:admin_panel_app/presentation/widgets/selecting_owner_or_hospital.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OwnerReportsMobile extends StatefulWidget {
    const OwnerReportsMobile({super.key});

  @override
  State<OwnerReportsMobile> createState() => _OwnerReportsMobileState();
}

class _OwnerReportsMobileState extends State<OwnerReportsMobile> {
  final List<ReportModel> navBar = [
    ReportModel(
      name: "Name",
      email: 'E-mail',
      id: 'Id',
      location: 'Location',
      phone: 'Phone',
      board: 'Board',
    )
  ];

  final GlobalKey<ScaffoldState> ssscaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ssscaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const HeaderDesktop(title: ''),
        leading: IconButton(
            onPressed: () {
              ssscaffoldKey.currentState!.openDrawer();
            },
            icon: SvgPicture.asset(
              Assets.imagesAuthImagesMenu,
              height: 25,
            )),
      ),
      drawer: CustomDrawer(
        activeIndex: 1,
        onTap: (index) {},
      ),
      backgroundColor: const Color.fromRGBO(217, 217, 217, 0.7),
      bottomNavigationBar: BottomAppBar(
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
                    child: SvgPicture.asset(Assets.imagesAuthImagesChartIcon)),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height -
                  MediaQuery.sizeOf(context).height * .11,
              width: MediaQuery.of(context).size.width,
              color: const Color.fromRGBO(217, 217, 217, 0.7),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SelectingOwnerOrHospital(
                        selectedIndex: 0,
                      ),
                      ReportOwnerBar(reportModel: navBar[0]),
                      const ReportOwnerInfoMobile(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

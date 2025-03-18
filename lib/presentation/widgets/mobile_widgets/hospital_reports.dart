import 'package:admin_panel_app/constants/app_images.dart';
import 'package:admin_panel_app/presentation/models/report_model.dart';
import 'package:admin_panel_app/presentation/widgets/custom_drawer.dart';
import 'package:admin_panel_app/presentation/widgets/header_desktop.dart';
import 'package:admin_panel_app/presentation/widgets/mobile_widgets/hospital_chart_dialog.dart';
import 'package:admin_panel_app/presentation/widgets/mobile_widgets/report_hospital_info.dart';
import 'package:admin_panel_app/presentation/widgets/report_hospital_bar.dart';
import 'package:admin_panel_app/presentation/widgets/selecting_owner_or_hospital.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HospitalReportMobile extends StatefulWidget {
  const HospitalReportMobile({super.key});

  @override
  State<HospitalReportMobile> createState() => _HospitalReportMobileState();
}

class _HospitalReportMobileState extends State<HospitalReportMobile> {
  final List<ReportModel> navBar = [
    ReportModel(
      name: "Name",
      email: 'E-mail',
      id: 'Id',
      address: 'Address',
      longitude: 'Longitude',
      latitude: 'Latitude',
    )
  ];

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      showHospitalChartDialog(context);
                    },
                    child: SvgPicture.asset(Assets.imagesAuthImagesChartIcon)),
              )
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(217, 217, 217, 0.7),
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
              activeIndex: 1,
              onTap: (index) {},
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SelectingOwnerOrHospital(
                selectedIndex: 1,
              ),
              ReportHospitalBar(reportModel: navBar[0]),
              const ReportsHospitalInfoMobile()
            ],
          ),
        ),
      ),
    );
  }
}

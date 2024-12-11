import 'package:admin_panel_app/presentation/models/report_model.dart';
import 'package:admin_panel_app/presentation/widgets/mobile_widgets/owner_reports.dart';
import 'package:admin_panel_app/presentation/widgets/report_owner_bar.dart';
import 'package:admin_panel_app/presentation/widgets/selecting_owner_or_hospital.dart';
import 'package:flutter/material.dart';

class OwnerReportsMobile extends StatelessWidget {
  OwnerReportsMobile({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color.fromRGBO(217, 217, 217, 0.7),
      body: Padding(
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
    );
  }
}

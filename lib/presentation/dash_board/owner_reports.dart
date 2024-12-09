import 'package:admin_panel_app/presentation/models/report_model.dart';
import 'package:admin_panel_app/presentation/widgets/report_owner_bar.dart';
import 'package:admin_panel_app/presentation/widgets/report_owner_info.dart';
import 'package:admin_panel_app/presentation/widgets/reports_owner_chart.dart';
import 'package:admin_panel_app/presentation/widgets/selecting_owner_or_hospital.dart';
import 'package:flutter/material.dart';

class OwnerReports extends StatelessWidget {
  OwnerReports({super.key});

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            MediaQuery.sizeOf(context).width < 800 ? const Text('') : const ReportsOwnerChart(),
            const SelectingOwnerOrHospital(
              selectedIndex: 0,
            ),
            ReportOwnerBar(reportModel: navBar[0]),
            const ReportOwnerInfo(),
          ],
        ),
      ),
    );
  }
}

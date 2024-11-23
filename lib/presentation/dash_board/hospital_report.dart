import 'package:admin_panel_app/presentation/models/report_model.dart';
import 'package:admin_panel_app/presentation/widgets/report_hospital_bar.dart';
import 'package:admin_panel_app/presentation/widgets/reports_hospital_chart.dart';
import 'package:admin_panel_app/presentation/widgets/reports_hospital_info.dart';
import 'package:admin_panel_app/presentation/widgets/selecting_owner_or_hospital.dart';
import 'package:flutter/material.dart';

class HospitalReport extends StatelessWidget {
  HospitalReport({super.key});

  final List<ReportModel> navBar = [
    ReportModel(
      name: "Name",
      email: 'E-mail',
      id: 'Id',
      firperson: 'FirPerson',
      longitude: 'Longitude',
      latitude: 'Latitude',
    )
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ReportsHospitalChart(),
          const SelectingOwnerOrHospital(
            selectedIndex: 1,
          ),
          ReportHospitalBar(reportModel: navBar[0]),
          const ReportsHospitalInfo()
        ],
      ),
    );
  }
}

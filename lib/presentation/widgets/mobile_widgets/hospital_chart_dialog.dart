 import 'package:admin_panel_app/presentation/widgets/mobile_widgets/hospital_charts.dart';
import 'package:flutter/material.dart';
 

void showHospitalChartDialog(BuildContext context) {

  showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return const AlertDialog(
          scrollable: true,
          titlePadding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          content: Column(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 HospitalCharts()
            ],
          ),
        ]));
      });
}

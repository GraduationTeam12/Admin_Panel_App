import 'package:admin_panel_app/presentation/widgets/mobile_widgets/charts_owner.dart';
import 'package:flutter/material.dart';
 

void showOwnerChartDialog(BuildContext context) {

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
                 OwnerCharts()
            ],
          ),
        ]));
      });
}

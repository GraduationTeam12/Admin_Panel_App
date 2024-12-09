 import 'package:admin_panel_app/presentation/models/chart_model.dart';
import 'package:admin_panel_app/presentation/widgets/reports_hospital_detail.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HospitalCharts extends StatelessWidget {
  const HospitalCharts({super.key});

  List<ChartReportModel> showChartsValue() {
    return [
      ChartReportModel('Sa', 270, 50, 200),
      ChartReportModel('Su', 130, 50, 250),
      ChartReportModel('Mo', 320, 50, 290),
      ChartReportModel('Tu', 410, 50, 250),
      ChartReportModel('We', 270, 50, 360),
      ChartReportModel('Th', 120, 50, 180),
      ChartReportModel('Fr', 380, 50, 100),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.sizeOf(context).width < 800 ? EdgeInsets.zero : const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
      child: SizedBox(
          height: 340,
        width: 350,
         
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               const ReportsHospitalDetail(),
      
              const SizedBox(
              height: 20,
             ),
              Expanded(
                child: SfCartesianChart(
                  primaryXAxis: const CategoryAxis(
                    majorGridLines: MajorGridLines(width: 0),
                  ),
                  primaryYAxis: const NumericAxis(),
                  enableAxisAnimation: true,
                  enableMultiSelection: true,
                  // margin: EdgeInsets.zero,
                  series: [
                    StackedColumnSeries<ChartReportModel, String>(
                        width: 0.25,
                        borderRadius: BorderRadius.circular(5),
                        dataSource: showChartsValue(),
                        xValueMapper: (ChartReportModel data, _) => data.xAxis,
                        yValueMapper: (ChartReportModel data, _) => data.value1,
                        color: Colors.amber),
                    StackedColumnSeries<ChartReportModel, String>(
                        width: 0.25,
                        borderRadius: BorderRadius.circular(5),
                        dataSource: showChartsValue(),
                        xValueMapper: (ChartReportModel data, _) => data.xAxis,
                        yValueMapper: (ChartReportModel data, _) => data.value2,
                        color: Colors.white),
                    StackedColumnSeries<ChartReportModel, String>(
                        width: 0.25,
                        borderRadius: BorderRadius.circular(5),
                        dataSource: showChartsValue(),
                        xValueMapper: (ChartReportModel data, _) => data.xAxis,
                        yValueMapper: (ChartReportModel data, _) => data.value3,
                        color: const Color.fromARGB(255, 235, 235, 152)),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
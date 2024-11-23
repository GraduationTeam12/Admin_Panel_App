import 'package:admin_panel_app/presentation/models/chart_model.dart';
import 'package:admin_panel_app/presentation/widgets/reports_hospital_detail.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ReportsHospitalChart extends StatefulWidget {
  const ReportsHospitalChart({super.key});

  @override
  State<ReportsHospitalChart> createState() => _ReportsHospitalChartState();
}

class _ReportsHospitalChartState extends State<ReportsHospitalChart> {
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
      padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
      child: Container(
          height: 300,
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 15,
            left: 15,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 4, offset: Offset(0, 4))
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               const ReportsHospitalDetail(),
      
              const SizedBox(
                width: 35,
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

import 'package:admin_panel_app/core/data/model/analysis_model/analysis_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StackedColumnChart extends StatelessWidget {
  const StackedColumnChart(
      {super.key,
      required this.analysisModel,
      required this.monthlyUserCounts,
      required this.monthlyEmergencyCounts});
  final AnalysisModel? analysisModel;
  final Map<int, int>? monthlyUserCounts;
  final Map<int, Map<String, int>>? monthlyEmergencyCounts;

  @override
  Widget build(BuildContext context) {
    final TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);

    return analysisModel == null
        ? Shimmer.fromColors(
            child: SizedBox(),
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100)
        : Container(
            height: MediaQuery.sizeOf(context).width < 1201 ? 400 : 310,
            margin: const EdgeInsets.only(left: 10),
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
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 4))
                ]),
            child: SfCartesianChart(
              tooltipBehavior: _tooltipBehavior,
              legend: const Legend(isVisible: true),
              primaryXAxis: const CategoryAxis(),
              primaryYAxis: const NumericAxis(),
              series: [
                StackedColumnSeries<ChartData, String>(
                  dataSource: getChartData(),
                  xValueMapper: (ChartData data, _) => data.category,
                  yValueMapper: (ChartData data, _) => data.value4,
                  name: 'Cranes',
                  color:
                      const Color.fromRGBO(61, 100, 152, 1), // لون بنفسجي مثلاً
                ),
                StackedColumnSeries<ChartData, String>(
                  dataSource: getChartData(),
                  xValueMapper: (ChartData data, _) => data.category,
                  yValueMapper: (ChartData data, _) => data.value2,
                  name: 'Hospital',
                  color: const Color.fromRGBO(18, 183, 106, 1),
                ),
                StackedColumnSeries<ChartData, String>(
                  dataSource: getChartData(),
                  xValueMapper: (ChartData data, _) => data.category,
                  yValueMapper: (ChartData data, _) => data.value1,
                  name: 'Fire Station',
                  color: const Color.fromRGBO(255, 168, 0, 1),
                ),
                StackedColumnSeries<ChartData, String>(
                  dataSource: getChartData(),
                  xValueMapper: (ChartData data, _) => data.category,
                  yValueMapper: (ChartData data, _) => data.value3,
                  name: 'Owner',
                  color: const Color(0xFF00BFFF),
                ),
              ],
            ),
          );
  }

  List<ChartData> getChartData() {
    const List<String> monthNames = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    return List.generate(12, (index) {
      final monthIndex = index + 1;

      final fireCount =
          (monthlyEmergencyCounts?[monthIndex]?['firestations'] ?? 0)
              .toDouble();
      final hospitalCount =
          (monthlyEmergencyCounts?[monthIndex]?['hospitals'] ?? 0).toDouble();
      final craneCount =
          (monthlyEmergencyCounts?[monthIndex]?['cranes'] ?? 0).toDouble();
      final ownerCount = (monthlyUserCounts?[monthIndex] ?? 0).toDouble();

      return ChartData(
        monthNames[index],
        fireCount,
        hospitalCount,
        ownerCount,
        craneCount,
      );
    });
  }
}

class ChartData {
  ChartData(this.category, this.value1, this.value2, this.value3, this.value4);
  final String category;
  final double value1;
  final double value2;
  final double value3;
  final double value4;
}

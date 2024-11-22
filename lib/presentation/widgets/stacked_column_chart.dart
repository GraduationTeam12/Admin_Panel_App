
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StackedColumnChart extends StatelessWidget {
  const StackedColumnChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
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
                color: Colors.black26, blurRadius: 4, offset: Offset(0, 4))
          ]),
      child: SfCartesianChart(
        legend:const Legend(isVisible: true),
        primaryXAxis:const CategoryAxis(),
        primaryYAxis:const NumericAxis(
        ),
        series: [
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
            yValueMapper: (ChartData data, _) => data.value2,
            name: 'Hospital',
            color: const Color.fromRGBO(18, 183, 106, 1),
          ),
          StackedColumnSeries<ChartData, String>(
            dataSource: getChartData(),
            xValueMapper: (ChartData data, _) => data.category,
            yValueMapper: (ChartData data, _) => data.value3,
            name: 'Owner',
            color: const Color.fromRGBO(61, 100, 152, 1),
          ),
        ],
      ),
    );
  }

  List<ChartData> getChartData() {
    return [
      ChartData('Jan', 3600, 3456, 7085),
      ChartData('Feb', 3500, 1000, 6400),
      ChartData('Mar', 5850, 7000, 8010),
      ChartData('Apr', 6300, 9000, 8064),
      ChartData('May', 3800, 2880, 4896),
      ChartData('Jun', 2200, 7300, 6300),
      ChartData('Jul', 2500, 4000, 5064),
      ChartData('Aug', 8900, 4000, 3000),
      ChartData('Sep', 1500, 1000, 7000),
      ChartData('Oct', 9800, 3000, 2000),
      ChartData('Nov', 2500, 4000, 5064),
      ChartData('Dec', 3000, 3500, 4000),
    ];
  }
}

class ChartData {
  ChartData(this.category, this.value1, this.value2, this.value3);
  final String category;
  final double value1;
  final double value2;
  final double value3;
}
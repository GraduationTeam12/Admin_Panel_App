import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PartDiagramYearChart extends StatelessWidget {
  const PartDiagramYearChart(
      {super.key,
      required this.title,
      required this.percent,
      required this.myColor});
  final String title;
  final double percent;
  final Color myColor;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: percent),
            duration: const Duration(milliseconds: 2000),
            builder: (context, animatedPercent, child) {
              return CircularPercentIndicator(
      radius:MediaQuery.of(context).size.width<1201&&MediaQuery.of(context).size.width>850?62: 50.0,
      lineWidth: 10.0,
      animation: true,
      percent: percent,
      center: Text(
        "${(animatedPercent * 100).toInt()}%",
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
      ),
      header: Text(
        title,
        style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontFamily: "Inter"),
      ),
      backgroundWidth: 5,
      animationDuration: 2000,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: myColor,
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0.2),
    );
  
            },
          );
  }
}

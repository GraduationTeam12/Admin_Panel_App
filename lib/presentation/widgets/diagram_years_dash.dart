import 'package:admin_panel_app/core/data/model/analysis_model/analysis_model.dart';
import 'package:admin_panel_app/presentation/widgets/part_digram_year_chart.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DiagramYearsDash extends StatefulWidget {
  const DiagramYearsDash({super.key, required this.analysisModel});

  final AnalysisModel? analysisModel;
  @override
  State<DiagramYearsDash> createState() => _DiagramYearsDashState();
}

class _DiagramYearsDashState extends State<DiagramYearsDash> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      margin: const EdgeInsets.only(bottom: 10, left: 10),
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
      child:widget.analysisModel == null
  ? Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title placeholder
          Container(
            height: 25,
            width: 120,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          // Sub-title placeholder
          Container(
            height: 20,
            width: 150,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          // Description placeholder
          Container(
            height: 40,
            width: double.infinity,
            margin:  EdgeInsets.only(bottom: 20,right:Directionality.of(context) == TextDirection.ltr ?20:0,left:Directionality.of(context) == TextDirection.rtl ?20:0),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          // Chart circles placeholder
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(3, (index) {
              return Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
        ],
      ),
    )
:   Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Analytic",
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontFamily: "Inter"),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Analytic This Year",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(142, 147, 166, 1),
                fontFamily: "Inter"),
          ),
          const Text(
            "Conducting a survey on the increase in each category within the application this year, and this table shows the amount of that increase.",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(86, 86, 86, 1),
                fontFamily: "Inter"),
          ),
          const SizedBox(
            height: 20,
          ),

          widget.analysisModel == null ? const Center(child: CircularProgressIndicator(),) :
          Row(
            children: [
              Expanded(
                  child: PartDiagramYearChart(
                title: "Cranes",
                percent: widget.analysisModel!.emergencies.cranes / 100,
                myColor: const Color.fromRGBO(61, 100, 152, 1),
              )),
              Expanded(
                  child: PartDiagramYearChart(
                title: "Hospital",
                percent: widget.analysisModel!.emergencies.hospitals / 100,
                myColor: const Color.fromRGBO(18, 183, 106, 1),
              )),
                Expanded(
                  child: PartDiagramYearChart(
                title: "Fire station",
                percent: widget.analysisModel!.emergencies.fireStations / 100,
                myColor: const Color.fromRGBO(255, 168, 0, 1),
              )),
            ],
          )
        ],
      ),
    );
  }
}

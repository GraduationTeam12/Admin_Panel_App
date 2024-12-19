import 'package:admin_panel_app/presentation/widgets/part_digram_year_chart.dart';
import 'package:flutter/material.dart';

class DiagramYearsDash extends StatefulWidget {
  const DiagramYearsDash({super.key});

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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Analytic",
            style:  TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontFamily: "Inter"),
          ),
           SizedBox(
            height: 10,
          ),
           Text(
            "Analytic This Year",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(142, 147, 166, 1),
                fontFamily: "Inter"),
          ),
           Text(
            "Conducting a survey on the increase in each category within the application this year, and this table shows the amount of that increase.",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(86, 86, 86, 1),
                fontFamily: "Inter"),
          ),
         SizedBox(height: 20,),
          Row(
            children: [
            Expanded(child: PartDiagramYearChart(title: "Owners", percent: 0.7,myColor: Color.fromRGBO(61, 100, 152, 1),)),
            
            Expanded(child: PartDiagramYearChart(title: "Hospital", percent: 0.9,myColor: Color.fromRGBO(18, 183, 106, 1),)),
            
            Expanded(child: PartDiagramYearChart(title: "Fire station", percent: 0.6,myColor: Color.fromRGBO(255, 168, 0, 1),)),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:admin_panel_app/presentation/widgets/part_digram_year_chart.dart';
import 'package:flutter/material.dart';

class DiagramNewUser extends StatelessWidget {
  const DiagramNewUser({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 310,
      margin: const EdgeInsets.only(bottom: 10, left: 10),
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
          Padding(
            padding:  EdgeInsets.only(
              left: 15,
              top: 15
            ),
            child: Text(
              "NEW User",
              style:  TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontFamily: "Inter"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding:  EdgeInsets.only(
              
              left: 15,
            ),
            child: Text(
              "21",
              style:  TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontFamily: "Inter"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PartDiagramYearChart(title: "Daily", percent: 0.63, myColor: Color.fromRGBO(61, 100, 152, 1)),
            ],
          ),
          
        ],
      ),
    );
  
  }
}
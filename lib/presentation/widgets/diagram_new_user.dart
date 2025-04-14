import 'package:admin_panel_app/core/data/model/analysis_model/analysis_model.dart';
import 'package:admin_panel_app/presentation/widgets/part_digram_year_chart.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DiagramNewUser extends StatelessWidget {
  const DiagramNewUser({super.key, required this.analysisModel});

  final AnalysisModel? analysisModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      margin: const EdgeInsets.only(bottom: 10, left: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, blurRadius: 4, offset: Offset(0, 4))
          ]),
      child:  analysisModel == null
          ? Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title placeholder (Users)
                    Container(
                      height: 24,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Number placeholder (Users count)
                    Container(
                      height: 38,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(height: 60),


                    // Chart placeholder (Fake chart bar)
                  Center(
                    child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                                    ),
                                  ),
                  )
                  ],
                ),
              ),
            )
    : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 15),
            child: Text(
              "Users",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontFamily: "Inter"),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            child: Text(
              "${analysisModel!.users}",
              style: const TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontFamily: "Inter"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PartDiagramYearChart(
                  title: "Daily",
                  percent: analysisModel!.users / 100,
                  myColor: const Color.fromRGBO(61, 100, 152, 1)),
            ],
          ),
        ],
      ),
    );
  }
}

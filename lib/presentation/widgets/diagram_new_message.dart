import 'package:admin_panel_app/core/data/model/analysis_model/analysis_model.dart';
import 'package:admin_panel_app/presentation/widgets/linear_progress_box.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DiagramNewMessage extends StatelessWidget {
  const DiagramNewMessage({super.key, required this.analysisModel});
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
      child: analysisModel == null
    ? Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // NEW MESSAGES title
              Container(
                height: 24,
                width: 140,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 10),
              
              // Number
              Container(
                height: 38,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),

              // Fake progress bar
              Container(
                height: 10,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),

              // Response Rate text
              Container(
                height: 14,
                width: 100,
                margin: const EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        ),
      )
    :const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(
              left: 15,
              top: 15
            ),
            child: Text(
              "NEW MESSAGES",
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
              "85",
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
          Divider(),
          
        LinearProgressBox(progress: 0.7,),
       Padding(
           padding:  EdgeInsets.only(
              left: 20,
            ),         child: Text(
                  'Response Rate',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.black),
                ),
       ),
        ],
      ),
    );
  }
}

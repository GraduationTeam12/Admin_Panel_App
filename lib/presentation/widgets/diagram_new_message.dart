import 'package:admin_panel_app/presentation/widgets/linear_progress_box.dart';
import 'package:flutter/material.dart';

class DiagramNewMessage extends StatelessWidget {
  const DiagramNewMessage({super.key});

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
      child: const Column(
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

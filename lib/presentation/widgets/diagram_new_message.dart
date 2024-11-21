import 'package:flutter/material.dart';

class DiagramNewMessage extends StatelessWidget {
  const DiagramNewMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      margin: const EdgeInsets.only(bottom: 10, left: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, blurRadius: 4, offset: Offset(0, 4))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
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
          const SizedBox(
            height: 10,
          ),
          const Padding(
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
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
        //  Padding(
        //       padding: EdgeInsets.all(15.0),
        //       child:  LinearPercentIndicator(
        //         width: 200,
        //         animation: true,
        //         lineHeight: 15.0,
        //         animationDuration: 2000,
        //         percent: 0.9,
        //         center: Text("90.0%"),
        //         linearStrokeCap:LinearStrokeCap.roundAll ,
        //         progressColor: Colors.greenAccent,
        //       ),
        //     ),
        ],
      ),
    );
  }
}

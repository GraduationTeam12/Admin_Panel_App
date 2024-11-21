import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class DiagramCustom extends StatefulWidget {
  const DiagramCustom(
      {super.key,
      required this.title,
      required this.number,
      required this.subTitle, required this.img, required this.myColor});
  final String title;
  final int number;
  final String subTitle;
  final String img;
  final Color myColor;

  @override
  State<DiagramCustom> createState() => _DiagramCustomState();
}

class _DiagramCustomState extends State<DiagramCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(bottom: 10,left: 10),
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 15,),
      width: 355,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, blurRadius: 4, offset: Offset(0, 4))
          ]),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontFamily: "Inter"),
              ),
              const Text(
                "Analytic This Mount",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(142, 147, 166, 1),
                    fontFamily: "Inter"),
              ),
              Text(
                widget.number.toString(),
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                    color: widget.myColor,
                    fontFamily: "Inter"),
              ),
              Text(
                widget.subTitle,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(142, 147, 166, 1),
                    fontFamily: "Inter"),
              ),
            ],
          ),
          Positioned(
              right: 0,
              top: 10,
              child:
                  SvgPicture.asset(widget.img,width: MediaQuery.sizeOf(context).width/7,))
        ],
      ),
    );
  }
}

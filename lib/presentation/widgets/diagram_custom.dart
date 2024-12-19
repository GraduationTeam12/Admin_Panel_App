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
      height: MediaQuery.sizeOf(context).width<1201&&MediaQuery.sizeOf(context).width>800?300:null,
      width: MediaQuery.of(context).size.width<1201&&MediaQuery.of(context).size.width>799?MediaQuery.of(context).size.width:355,
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
              FittedBox(
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontFamily: "Inter"),
                ),
              ),
              const Text(
                "Analytic This Mount",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(142, 147, 166, 1),
                    fontFamily: "Inter"),
              ),
              TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: widget.number.toDouble()),
            duration: const Duration(milliseconds: 2000),
            builder: (context, animatedNumber, child) {
              return Text(
                animatedNumber.toInt().toString(),
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                    color: widget.myColor,
                    fontFamily: "Inter"),
              );
            },
          ),
              FittedBox(
                child: Text(
                  widget.subTitle,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(142, 147, 166, 1),
                      fontFamily: "Inter"),
                ),
              ),
            ],
          ),
          Positioned(
              right:MediaQuery.sizeOf(context).width>800&&MediaQuery.sizeOf(context).width<1201?30: 10,
              top: 10,
              left: MediaQuery.sizeOf(context).width>800&&MediaQuery.sizeOf(context).width<1201?30: null,
              child:
                  SvgPicture.asset(widget.img,height:MediaQuery.sizeOf(context).width<1201&&MediaQuery.sizeOf(context).width>800?250:null,width: MediaQuery.sizeOf(context).width <800 ? null : MediaQuery.of(context).size.width<1201?MediaQuery.sizeOf(context).width*0.6: MediaQuery.sizeOf(context).width/7,))
        ],
      ),
    );
  }
}

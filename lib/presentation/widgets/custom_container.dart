import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MediaQuery.sizeOf(context).width < 800 ?  
    Padding(
            padding: MediaQuery.sizeOf(context).width < 800 ?  EdgeInsets.zero : const EdgeInsets.only(left: 50),
            child: Container(
              padding: MediaQuery.sizeOf(context).width < 800 ? const EdgeInsets.all(30) : EdgeInsets.zero,
                width: MediaQuery.sizeOf(context).width < 800 ? MediaQuery.sizeOf(context).width :  900,
                height: MediaQuery.sizeOf(context).width < 800 ? MediaQuery.sizeOf(context).height : 600,
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.white,
                    shadows: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        spreadRadius: 0,
                        offset: Offset(0, 4),
                        blurRadius: 4,
                      )
                    ]),
                child: child))
     : Center(
        child: Padding(
            padding: MediaQuery.sizeOf(context).width < 800 ?  EdgeInsets.zero : const EdgeInsets.only(left: 50),
            child: Container(
                width: MediaQuery.sizeOf(context).width < 800 ? null :  900,
                height: MediaQuery.sizeOf(context).width < 800 ? null : 600,
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.white,
                    shadows: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        spreadRadius: 0,
                        offset: Offset(0, 4),
                        blurRadius: 4,
                      )
                    ]),
                child: child)));
  }
}

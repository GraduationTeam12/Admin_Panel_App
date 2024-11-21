import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Container(
                width: 900,
                height: 600,
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

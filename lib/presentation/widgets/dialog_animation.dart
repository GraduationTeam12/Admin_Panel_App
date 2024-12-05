// ignore_for_file: library_private_types_in_public_api

 
import 'package:flutter/material.dart';

class ThreeDotsAnimation extends StatefulWidget {
  const ThreeDotsAnimation({super.key});

  @override
  _ThreeDotsAnimationState createState() => _ThreeDotsAnimationState();
}

class _ThreeDotsAnimationState extends State<ThreeDotsAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, -25 * (_getDotValue(index))),
              child: child,
            );
          },
          child: Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        );
      }),
    );
  }

  double _getDotValue(int index) {
    double progress = (_controller.value + (index / 3)) % 1.0;
    return progress <= 0.5 ? 2 * progress : 2 * (1 - progress);
  }
}

void showLoadingDialog(BuildContext context) {
  showDialog(
  context: context,
   barrierDismissible: false,
  builder: (context) => Dialog(
    backgroundColor: Colors.transparent,
    child: Container(
       width: 200,
       height: 200,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 39, 76, 124).withOpacity(0.7),  
        borderRadius: BorderRadius.circular(25),
      ),
      child: const SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 40),
            // Text(
            //   "Creating Account",
            //   style: AppStyle.styleBold20(context).copyWith(
            //     color: Colors.white,
            //     fontFamily: 'Inter',
            //     fontSize: 25
            //   ),
            // ),
            SizedBox(height: 40),
            ThreeDotsAnimation(),
          ],
        ),
      ),
    ),
  ),
);

}

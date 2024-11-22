import 'package:flutter/material.dart';

class LinearProgressBox extends StatelessWidget {
  final double progress;

  const LinearProgressBox({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  MediaQuery.sizeOf(context).width / 3 ,
      padding: const EdgeInsets.only(left: 16,right: 16,bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: progress),
            duration: const Duration(milliseconds: 2000),
            builder: (context, animatedProgress, child) {
              return   Container(
            margin: EdgeInsets.only(
                left:progress>0.85? MediaQuery.sizeOf(context).width / 6.2 * 0.85: MediaQuery.sizeOf(context).width / 6.2 * animatedProgress),
            child: Stack(
              children: [
                Container(
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                          color: Color.fromRGBO(0, 0, 0, 0.2))
                    ]),
                    child: const Icon(
                      Icons.messenger,
                      color: Colors.white,
                      size: 38,
                    )),
                Positioned(
                  top: 5,
                  left:progress==1?5: 7,
                  child: Text(
                    "${(animatedProgress * 100).toInt()}%",
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          );
            },
          ),
          const SizedBox(height: 10),
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: progress),
            duration: const Duration(milliseconds: 2000),
            builder: (context, animatedProgress, child) {
              return LinearProgressIndicator(
                value: animatedProgress,
                borderRadius: BorderRadius.circular(15),
                minHeight: 14,
                color: const Color.fromRGBO(255, 180, 65, 1),
                backgroundColor: const Color.fromRGBO(0, 0, 0, 0.2),
              );
            },
          ),
        ],
      ),
    );
  }
}

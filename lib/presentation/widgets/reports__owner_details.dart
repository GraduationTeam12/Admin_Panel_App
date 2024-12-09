import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:flutter/material.dart';

class ReportsOwnerDetails extends StatelessWidget {
  const ReportsOwnerDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: MediaQuery.sizeOf(context).width < 800 ? EdgeInsets.zero : const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Added",
            style: AppStyle.styleBold25(context)
                .copyWith(fontSize: 27, color: Colors.black),
          ),
          Text(
            "All Owners Added in this system",
            style: AppStyle.styleRegular16(context),
          ),
          const SizedBox(
            height: 35,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: MyColors.premiumColor,
                    borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(
                width: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0, end: 80),
                    duration: const Duration(milliseconds: 1500),
                    builder: (context, value, child) {
                      return Text(
                        value.toInt().toString(),
                        style: AppStyle.styleBold25(context).copyWith(
                            fontSize: 23,
                            color: Colors.black,
                            fontWeight: FontWeight.w900),
                      );
                    },
                  ),
                  Text(
                    "Owners",
                    style: AppStyle.styleRegular16(context),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

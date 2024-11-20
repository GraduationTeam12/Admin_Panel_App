import 'package:admin_panel_app/constants/app_images.dart';
import 'package:admin_panel_app/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsAndContactUs extends StatelessWidget {
  const SettingsAndContactUs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){},
          child: Row(
            children: [
              SvgPicture.asset(Assets.imagesAuthImagesSettingsDrawer),
              Text(
                "Settings",
                style: AppStyle.styleRegular25(context),
              )
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 8,
          ),
        ),
        GestureDetector(
          onTap: (){},
          child: Row(
            children: [
              SvgPicture.asset(Assets.imagesAuthImagesContactUsDrawer),
              Text(
                "Contact us",
                style: AppStyle.styleRegular25(context),
              )
            ],
          ),
        ),
      ],
    );
  }
}
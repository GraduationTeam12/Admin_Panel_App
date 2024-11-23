import 'package:admin_panel_app/constants/app_images.dart';
import 'package:admin_panel_app/presentation/widgets/custom_container.dart';
import 'package:admin_panel_app/presentation/widgets/report_information_editing_fields.dart';
import 'package:flutter/material.dart';

class ReportOwnerEditingInformation extends StatelessWidget {
  const ReportOwnerEditingInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 90 , vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.white,
                image: const DecorationImage(
                  image: AssetImage(
                      Assets.imagesAuthImagesOwnerReportEditing
                  ),
                   fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(50),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const ReportInformationEditingFields()
          ],
        ),
      ),
    );
  }
}

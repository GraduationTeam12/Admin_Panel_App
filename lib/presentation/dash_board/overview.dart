import 'package:admin_panel_app/constants/app_images.dart';
import 'package:admin_panel_app/presentation/widgets/diagram_analytic.dart';
import 'package:admin_panel_app/presentation/widgets/diagram_custom.dart';
import 'package:admin_panel_app/presentation/widgets/diagram_new_message.dart';
import 'package:admin_panel_app/presentation/widgets/diagram_new_user.dart';
import 'package:admin_panel_app/presentation/widgets/diagram_years_dash.dart';
import 'package:admin_panel_app/presentation/widgets/stacked_column_chart.dart';
import 'package:flutter/material.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: const Column(
          children: [
          
                Row(
                children: [
                  Expanded(child: DiagramCustom(title: "Owners", number: 4600, subTitle: "Owner",img: Assets.imagesAuthImagesBlueChart,myColor: Color.fromRGBO(61, 100, 152, 1),)),
                  Expanded(child: DiagramCustom(title: "Hospitals", number: 9000, subTitle: "Hospital",img: Assets.imagesAuthImagesGreenChart,myColor: Color.fromRGBO(18, 183, 106, 1),)),
                  Expanded(child: DiagramCustom(title: "Fire Station", number: 700, subTitle: "Fire Station",img: Assets.imagesAuthImagesDiagramFireStation,myColor: Color.fromRGBO(255, 168, 0, 1),))
                ],
              ),
      
              Row(
                children: [
                   Expanded(flex:11,child: DiagramYearsDash()),
                   Expanded(flex:7,child: DiagramNewMessage()),
                   Expanded(flex:6,child: DiagramNewUser()),
                   Expanded(flex:5,child: DiagramAnalytic())
      
                ],
              ),

            StackedColumnChart()
          ],
        ),
      ),
    );
  }
}

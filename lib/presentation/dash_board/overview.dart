import 'package:admin_panel_app/constants/app_images.dart';
import 'package:admin_panel_app/presentation/widgets/diagram_analytic.dart';
import 'package:admin_panel_app/presentation/widgets/diagram_custom.dart';
import 'package:admin_panel_app/presentation/widgets/diagram_new_message.dart';
import 'package:admin_panel_app/presentation/widgets/diagram_new_user.dart';
import 'package:admin_panel_app/presentation/widgets/diagram_years_dash.dart';
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
        child: Column(
          children: [
          
               const Row(
                children: [
                  Expanded(child: DiagramCustom(title: "Owners", number: 4600, subTitle: "Owner",img: Assets.imagesAuthImagesOwnerCounterDiagram,myColor: Color.fromRGBO(18, 183, 106, 1),)),
                  Expanded(child: DiagramCustom(title: "Hospitals", number: 9000, subTitle: "Hospital",img: Assets.imagesAuthImagesHospitalCounterDiagram,myColor: Color.fromRGBO(61, 100, 152, 1),)),
                  Expanded(child: DiagramCustom(title: "Fire Station", number: 700, subTitle: "Fire Station",img: Assets.imagesAuthImagesFireStationCounterDiagram,myColor: Color.fromRGBO(255, 168, 0, 1),))
                ],
              ),
      
              Row(
                children: [
                  const Expanded(flex:11,child: DiagramYearsDash()),
                  const Expanded(flex:7,child: DiagramNewMessage()),
                  const Expanded(flex:7,child: DiagramNewUser()),
                  const Expanded(flex:4,child: DiagramAnalytic())
      
                ],
              )
            
          ],
        ),
      ),
    );
  }
}

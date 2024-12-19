import 'package:admin_panel_app/constants/app_images.dart';
import 'package:admin_panel_app/presentation/widgets/diagram_analytic.dart';
import 'package:admin_panel_app/presentation/widgets/diagram_custom.dart';
import 'package:admin_panel_app/presentation/widgets/diagram_new_message.dart';
import 'package:admin_panel_app/presentation/widgets/diagram_new_user.dart';
import 'package:admin_panel_app/presentation/widgets/diagram_years_dash.dart';
import 'package:admin_panel_app/presentation/widgets/stacked_column_chart.dart';
import 'package:flutter/material.dart';

class TabletOverview extends StatefulWidget {
  const TabletOverview({super.key});

  @override
  State<TabletOverview> createState() => _TabletOverviewState();
}

class _TabletOverviewState extends State<TabletOverview> {
  final List<Widget> widgets = [
    const DiagramYearsDash(),
    const DiagramNewMessage(),
    const DiagramNewUser(),
    const DiagramAnalytic()
  ];
  final List<DiagramCustom> items = [
    const DiagramCustom(
      title: "Owners",
      number: 4600,
      subTitle: "Owner",
      img: Assets.imagesAuthImagesBlueChart,
      myColor: Color.fromRGBO(61, 100, 152, 1),
    ),
    const DiagramCustom(
      title: "Hospitals",
      number: 9000,
      subTitle: "Hospital",
      img: Assets.imagesAuthImagesGreenChart,
      myColor: Color.fromRGBO(18, 183, 106, 1),
    ),
    const DiagramCustom(
      title: "Fire Station",
      number: 700,
      subTitle: "Fire Station",
      img: Assets.imagesAuthImagesDiagramFireStation,
      myColor: Color.fromRGBO(255, 168, 0, 1),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: const Column(
          children: [
             DiagramCustom(
                        title: "Owners",
                        number: 4600,
                        subTitle: "Owner",
                        img: Assets.imagesAuthImagesOwnerGr,
                        myColor: Color.fromRGBO(61, 100, 152, 1),
                      ),
             DiagramCustom(
                        title: "Hospitals",
                        number: 9000,
                        subTitle: "Hospital",
                        img: Assets.imagesAuthImagesHospitalGr,
                        myColor: Color.fromRGBO(18, 183, 106, 1),
                      ),
                      DiagramCustom(
                        title: "Fire Station",
                        number: 700,
                        subTitle: "Fire Station",
                        img: Assets.imagesAuthImagesFireGr,
                        myColor: Color.fromRGBO(255, 168, 0, 1),
                      ) ,

              Row(
                    children: [
                      
                      Expanded(flex: 1, child: DiagramNewUser()),
                      Expanded(flex: 1, child: DiagramAnalytic())
                    ],
                  ),
                  Row(children: [
                    Expanded(flex: 1, child: DiagramYearsDash()),
                      Expanded(flex: 1, child: DiagramNewMessage()),
                  ],),
             StackedColumnChart()
          ],
        ),
      ),
    );
  }
}


// Column(
//           children: [
//             MediaQuery.sizeOf(context).width > 1201
//                 ? const Row(
//                     children: [
//                       Expanded(
//                           child: DiagramCustom(
//                         title: "Owners",
//                         number: 4600,
//                         subTitle: "Owner",
//                         img: Assets.imagesAuthImagesBlueChart,
//                         myColor: Color.fromRGBO(61, 100, 152, 1),
//                       )),
//                       Expanded(
//                           child: DiagramCustom(
//                         title: "Hospitals",
//                         number: 9000,
//                         subTitle: "Hospital",
//                         img: Assets.imagesAuthImagesGreenChart,
//                         myColor: Color.fromRGBO(18, 183, 106, 1),
//                       )),
//                       Expanded(
//                           child: DiagramCustom(
//                         title: "Fire Station",
//                         number: 700,
//                         subTitle: "Fire Station",
//                         img: Assets.imagesAuthImagesDiagramFireStation,
//                         myColor: Color.fromRGBO(255, 168, 0, 1),
//                       ))
//                     ],
//                   )
//                 : SizedBox(
//                     height: 200,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: items.length,
//                       itemBuilder: (context, index) {
//                         return DiagramCustom(
//                             title: items[index].title,
//                             number: items[index].number,
//                             subTitle: items[index].subTitle,
//                             img: items[index].img,
//                             myColor: items[index].myColor);
//                       },
//                     ),
//                   ),
//             MediaQuery.sizeOf(context).width < 1201
//                 ? SizedBox(
//                   height: 400,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: widgets.length,
//                     itemBuilder: (context, index) {
//                       return SizedBox(
//                          width: MediaQuery.sizeOf(context).width * 0.8, 
//                         child: widgets[index]);
//                     }),
//                 )
//                 : const Row(
//                     children: [
//                       Expanded(flex: 11, child: DiagramYearsDash()),
//                       Expanded(flex: 7, child: DiagramNewMessage()),
//                       Expanded(flex: 6, child: DiagramNewUser()),
//                       Expanded(flex: 5, child: DiagramAnalytic())
//                     ],
//                   ),
//             const StackedColumnChart()
//           ],
//         ),
      
import 'package:admin_panel_app/constants/app_images.dart';
import 'package:admin_panel_app/core/api/end_points.dart';
import 'package:admin_panel_app/core/cache/cache_helper.dart';
import 'package:admin_panel_app/core/data/model/analysis_model/analysis_model.dart';
import 'package:admin_panel_app/core/logic/analysis_cubit/analysis_cubit.dart';
import 'package:admin_panel_app/presentation/widgets/diagram_analytic.dart';
import 'package:admin_panel_app/presentation/widgets/diagram_custom.dart';
import 'package:admin_panel_app/presentation/widgets/diagram_new_message.dart';
import 'package:admin_panel_app/presentation/widgets/diagram_new_user.dart';
import 'package:admin_panel_app/presentation/widgets/diagram_years_dash.dart';
import 'package:admin_panel_app/presentation/widgets/stacked_column_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AnalysisCubit>(context).getAnalysis(
      CacheHelper().getData(key: ApiKeys.token),
    );
  }

  AnalysisModel? analysisModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<AnalysisCubit, AnalysisState>(
        builder: (context, state) {
          if (state is AnalysisError) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          if (state is AnalysisSuccess) {
            analysisModel = state.analysisModel;
          }
          return Container(
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                MediaQuery.sizeOf(context).width > 800
                    ? Row(
                        children: [
                          Expanded(
                              child: DiagramCustom(
                            analysisModel: analysisModel,
                            title: "Cranes",
                            number: analysisModel != null
                                ? analysisModel!.emergencies.cranes
                                : 0,
                            subTitle: "Cranes",
                            img: Assets.imagesAuthImagesBlueChart,
                            myColor: const Color.fromRGBO(61, 100, 152, 1),
                          )),
                          Expanded(
                              child: DiagramCustom(
                            analysisModel: analysisModel,
                            title: "Hospitals",
                            number: analysisModel != null
                                ? analysisModel!.emergencies.hospitals
                                : 0,
                            subTitle: "Hospital",
                            img: Assets.imagesAuthImagesGreenChart,
                            myColor: const Color.fromRGBO(18, 183, 106, 1),
                          )),
                          Expanded(
                              child: DiagramCustom(
                            analysisModel: analysisModel,
                            title: "Fire Station",
                            number: analysisModel != null
                                ? analysisModel!.emergencies.fireStations
                                : 0,
                            subTitle: "Fire Station",
                            img: Assets.imagesAuthImagesDiagramFireStation,
                            myColor: const Color.fromRGBO(255, 168, 0, 1),
                          ))
                        ],
                      )
                    : SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            final List<DiagramCustom> items = [
                              DiagramCustom(
                                title: "Cranes",
                                number: analysisModel != null
                                    ? analysisModel!.emergencies.cranes
                                    : 0,
                                subTitle: "Cranes",
                                img: Assets.imagesAuthImagesBlueChart,
                                myColor: const Color.fromRGBO(61, 100, 152, 1),
                                analysisModel: analysisModel,
                              ),
                              DiagramCustom(
                                analysisModel: analysisModel,
                                title: "Hospitals",
                                number: analysisModel != null
                                    ? analysisModel!.emergencies.hospitals
                                    : 0,
                                subTitle: "Hospital",
                                img: Assets.imagesAuthImagesGreenChart,
                                myColor: const Color.fromRGBO(18, 183, 106, 1),
                              ),
                              DiagramCustom(
                                analysisModel: analysisModel,
                                title: "Fire Station",
                                number: analysisModel != null
                                    ? analysisModel!.emergencies.fireStations
                                    : 0,
                                subTitle: "Fire Station",
                                img: Assets.imagesAuthImagesDiagramFireStation,
                                myColor: const Color.fromRGBO(255, 168, 0, 1),
                              )
                            ];
                            return DiagramCustom(
                                analysisModel: analysisModel,
                                title: items[index].title,
                                number: items[index].number,
                                subTitle: items[index].subTitle,
                                img: items[index].img,
                                myColor: items[index].myColor);
                          },
                        ),
                      ),
                MediaQuery.sizeOf(context).width < 800
                    ? SizedBox(
                        height: 400,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              final List<Widget> widgets = [
                                DiagramYearsDash(
                                  analysisModel: analysisModel,
                                ),
                                 DiagramNewMessage(analysisModel: analysisModel,),
                                DiagramNewUser(
                                  analysisModel: analysisModel,
                                ),
                                DiagramAnalytic(  analysisModel: analysisModel,)
                              ];
                              return SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  child: widgets[index]);
                            }),
                      )
                    : Row(
                        children: [
                          Expanded(
                              flex: 11,
                              child: DiagramYearsDash(
                                analysisModel: analysisModel,
                              )),
                           Expanded(flex: 7, child: DiagramNewMessage(analysisModel:analysisModel)),
                          Expanded(
                              flex: 6,
                              child: DiagramNewUser(
                                analysisModel: analysisModel,
                              )),
                           Expanded(flex: 5, child: DiagramAnalytic(analysisModel: analysisModel,))
                        ],
                      ),
                 StackedColumnChart(analysisModel: analysisModel,)
              ],
            ),
          );
        },
      ),
    );
  }
}

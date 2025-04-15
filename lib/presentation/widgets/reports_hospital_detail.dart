import 'dart:convert';

import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/core/api/end_points.dart';
import 'package:admin_panel_app/core/cache/cache_helper.dart';
import 'package:admin_panel_app/core/data/model/analysis_model/analysis_model.dart';
import 'package:admin_panel_app/core/logic/analysis_cubit/analysis_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportsHospitalDetail extends StatefulWidget {
  const ReportsHospitalDetail({super.key});

  @override
  State<ReportsHospitalDetail> createState() => _ReportsHospitalDetailState();
}

class _ReportsHospitalDetailState extends State<ReportsHospitalDetail> {
  @override
  void initState() {
    super.initState();

    // Load cached data first
    final cached = CacheHelper().getData(key: 'cached_analysis');
    if (cached != null) {
      final cachedModel = AnalysisModel.fromJson(jsonDecode(cached));
      analysisModel = cachedModel; // حفظ البيانات
      BlocProvider.of<AnalysisCubit>(context)
          .emit(AnalysisSuccess(cachedModel));
    }

    // Fetch latest data from API
    BlocProvider.of<AnalysisCubit>(context).getAnalysis(
      CacheHelper().getData(key: ApiKeys.token),
    );
  }

  AnalysisModel? analysisModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.sizeOf(context).width < 800
          ? EdgeInsets.zero
          : const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Added",
            style: AppStyle.styleBold25(context)
                .copyWith(fontSize: 27, color: Colors.black),
          ),
          Text(
            "All hospitals Added in this system",
            style: AppStyle.styleRegular16(context),
          ),
          const SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(
                width: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<AnalysisCubit, AnalysisState>(
                    builder: (context, state) {
                      if (state is AnalysisSuccess) {
                        analysisModel = state.analysisModel;

                        // حفظ البيانات في الكاش بعد تحميلها
                        CacheHelper().saveData(
                          key: 'cached_analysis',
                          value: jsonEncode(state.analysisModel.toJson()),
                        );
                      }

                      final int emergenciesCount =
                          (analysisModel?.emergencies.hospitals ?? 0) +
                              (analysisModel?.emergencies.fireStations ?? 0) +
                              (analysisModel?.emergencies.cranes ?? 0);
                      return TweenAnimationBuilder<double>(
                        tween: Tween<double>(
                            begin: 0, end: emergenciesCount.toDouble()),
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
                      );
                    },
                  ),
                  Text(
                    "Hospitals",
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

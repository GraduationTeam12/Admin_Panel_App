// ignore_for_file: must_be_immutable

import 'package:admin_panel_app/core/logic/navigation_cubit/navigation_cubit.dart';
import 'package:admin_panel_app/presentation/widgets/custom_drawer.dart';
import 'package:admin_panel_app/presentation/widgets/header_desktop.dart';
import 'package:admin_panel_app/presentation/widgets/survey_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DesktopDashboard extends StatelessWidget {
  DesktopDashboard({super.key});

  List<String> _pagesTitle = [
    "Overview",
    'Reports',
    "Notifictions",
    "Support",
    "Survey",
    "Add Owner",
    "Add hospital"
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(flex: 1, child: CustomDrawer()),
        Expanded(
          flex: 4,
          child: BlocBuilder<NavigationCubit, int>(
            builder: (context, pageIndex) {
              return Column(
                children: [
                  HeaderDesktop(
                    title: _pagesTitle[pageIndex],
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height -
                        MediaQuery.sizeOf(context).height * .11,
                    width: MediaQuery.of(context).size.width,
                    color: const Color.fromRGBO(217, 217, 217, 0.7),
                    child:pageIndex==4?const SurveyPage(): Center(child: Text(_pagesTitle[pageIndex])),
                  )
                ],
              );
            },
          ),
        )
      ],
    );
  }
}

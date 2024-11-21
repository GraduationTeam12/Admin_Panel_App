// ignore_for_file: must_be_immutable

import 'package:admin_panel_app/core/logic/navigation_cubit/navigation_cubit.dart';
import 'package:admin_panel_app/presentation/dash_board/add_owner.dart';
import 'package:admin_panel_app/presentation/widgets/add_owner_body.dart';
import 'package:admin_panel_app/presentation/widgets/confirming_info.dart';
import 'package:admin_panel_app/presentation/widgets/custom_drawer.dart';
import 'package:admin_panel_app/presentation/widgets/desktop_otp_owner.dart';
import 'package:admin_panel_app/presentation/widgets/get_information_body.dart';
import 'package:admin_panel_app/presentation/widgets/header_desktop.dart';
import 'package:admin_panel_app/presentation/widgets/otp_form.dart';
import 'package:admin_panel_app/presentation/widgets/selecting_num_of_board.dart';
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
    "Add hospital",
    "Add Owner",
    "Add Owner",
    "Add Owner",
    "Add Owner",
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
              return CustomScrollView(
                slivers: [SliverToBoxAdapter(
                  child: Column(
                    children: [
                      HeaderDesktop(
                        title: _pagesTitle[pageIndex],
                      ),
                      Container(
                        height: MediaQuery.sizeOf(context).height -
                            MediaQuery.sizeOf(context).height * .11,
                        width: MediaQuery.of(context).size.width,
                        color: const Color.fromRGBO(217, 217, 217, 0.7),
                        child: pageIndex == 4
                            ? const SurveyPage()
                            : pageIndex == 5
                                ? const AddOwnerBody()
                                : pageIndex == 7
                                    ? DesktopOtpOwner()
                                    : pageIndex == 8? GetInformationBody() : pageIndex == 9? SelectingNumOfBoard() : pageIndex == 10? ConfirmingInfo() : Center(child: Text(_pagesTitle[pageIndex])),
                      )
                    ],
                  ),
                ),
      ]);
            },
          ),
        )
      ],
    );
  }
}

//  child:pageIndex==4?const SurveyPage(): pageIndex == 5? const AddOwnerBody() : Center(child: Text(_pagesTitle[pageIndex]))
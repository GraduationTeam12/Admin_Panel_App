// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:html' as html;
import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_and_hospital_cubit.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_and_hospital_state.dart';
import 'package:admin_panel_app/core/logic/navigation_cubit/navigation_cubit.dart';
import 'package:admin_panel_app/presentation/dash_board/hospital_report.dart';
import 'package:admin_panel_app/presentation/dash_board/owner_reports.dart';
import 'package:admin_panel_app/routing/app_router.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class SelectingOwnerOrHospital extends StatefulWidget {
  const SelectingOwnerOrHospital({super.key, required this.selectedIndex});

  final int selectedIndex;
  @override
  State<SelectingOwnerOrHospital> createState() =>
      _SelectingOwnerOrHospitalState();
}

class _SelectingOwnerOrHospitalState extends State<SelectingOwnerOrHospital> {
  // void updateIndex(int index) {
  //   setState(() {
  //     widget.s = index;
  //   });
  // }
  String selectedType = "Owners";
  void downloadReportWeb(List<List<dynamic>> data,String type) {
      String csv = const ListToCsvConverter().convert(data);

      final bom = '\uFEFF'; 
      final fullCsv = bom + csv;

      final bytes = utf8.encode(fullCsv);

      final blob = html.Blob([bytes]); 

      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", "report_$type.csv")
        ..click();

      html.Url.revokeObjectUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MediaQuery.sizeOf(context).width < 800
          ? Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Material(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    child: TextFormField(
                      style: AppStyle.styleRegular16(context)
                          .copyWith(color: Colors.black),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        hintText: "Search",
                        hintStyle: AppStyle.styleRegular16(context),
                        contentPadding: const EdgeInsets.all(8),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  padding: const EdgeInsets.only(
                    // top: 15,
                    // bottom: 15,
                    left: 10,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(0, 4))
                      ]),
                  child: Row(children: [
                    InkWell(
                        onTap: () {
                          selectedType = "Owners";
                          // context.read<NavigationCubit>().navigateTo(10);
                          GoRouter.of(context)
                              .pushReplacementNamed(AppRouter.ownerReports);
                        },
                        child: Text(
                          "Owner",
                          style: AppStyle.styleBold25(context).copyWith(
                              fontFamily: 'Roboto',
                              color: widget.selectedIndex == 0
                                  ? Colors.black
                                  : const Color(0xFF5C5858),
                              fontWeight: widget.selectedIndex == 0
                                  ? FontWeight.w700
                                  : FontWeight.w400),
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                        onTap: () {
                          selectedType = "Hospitals";
                          // context.read<NavigationCubit>().navigateTo(11);
                          // Navigator.pushNamed(context, hospialReportsScreen);
                          // context.go(hospialReportsScreen);
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => HospitalReport()));
                          GoRouter.of(context)
                              .pushReplacementNamed(AppRouter.hospitalReports);
                        },
                        child: Text(
                          "Hospital",
                          style: AppStyle.styleBold25(context).copyWith(
                              fontFamily: 'Roboto',
                              color: widget.selectedIndex == 1
                                  ? Colors.black
                                  : const Color(0xFF5C5858),
                              fontWeight: widget.selectedIndex == 1
                                  ? FontWeight.w700
                                  : FontWeight.w400),
                        )),
                    const Spacer(),
                    BlocBuilder<AddOwnerAndHospitalCubit,
                      AddOwnerAndHospitalState>(
                    builder: (context, state) {
                      if (state is GetAllOwnerSuccess) {
                        final usersList = state.users;

                        return InkWell(
                          onTap: () {
                            final data = [
                              [
                                "Username",
                                "Email",
                                "Phone",
                                "Address",
                                "National Id",
                                "Board ID"
                              ],
                              ...usersList.map((user) => [
                                    user.username ?? "",
                                    user.email ?? "",
                                    "+2${user.phone}" ?? "",
                                    user.address?? "",
                                    user.nationalId ?? "", 
                                    user.boardId ?? "",
                                  ]),
                            ];

                            downloadReportWeb(data,"Owners");
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.download,
                                size: 16,
                                color: Color(0xFF5C5858),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Download",
                                style: AppStyle.styleRegular16(context)
                                    .copyWith(fontFamily: "Roboto"),
                              )
                            ],
                          ),
                        );
                      }
                      if (state is GetAllEmergenciesSuccess) {
                        final emergenciesList = state.emergencies;

                        return InkWell(
                          onTap: () {
                            final data = [
                              [
                                "Name",
                                "Type",
                                "Email",
                                "Phone",
                                "Address",
                                "ID",
                                "longitude",
                                "latitude",
                                "number"
                              ],
                              ...emergenciesList.map((emergencies) => [
                                    emergencies.name ,
                                    emergencies.type ,
                                    emergencies.email ,
                                    emergencies.phone,
                                    emergencies.address,
                                    emergencies.id , 
                                    emergencies.longitude,
                                    emergencies.latitude,
                                    emergencies.number
                                  ]),
                            ];

                            downloadReportWeb(data,"Hospital");
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.download,
                                size: 16,
                                color: Color(0xFF5C5858),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Download",
                                style: AppStyle.styleRegular16(context)
                                    .copyWith(fontFamily: "Roboto"),
                              )
                            ],
                          ),
                        );
                      }
                      return  InkWell(
                          onTap: () {
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.download,
                                size: 16,
                                color: Color(0xFF5C5858),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Download",
                                style: AppStyle.styleRegular16(context)
                                    .copyWith(fontFamily: "Roboto"),
                              )
                            ],
                          ),
                        );
                      
                    },
                  ),
                    const SizedBox(
                      width: 15,
                    ),
                  ]),
                ),
              ],
            )
          : Container(
              height: 70,
              padding: const EdgeInsets.only(
                // top: 15,
                // bottom: 15,
                left: 40,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 4))
                  ]),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () {
                        // context.read<NavigationCubit>().navigateTo(10);
                        // Navigator.pushNamed(context, hospialReportsScreen);
                        // context.go(hospialReportsScreen);
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => OwnerReports()));
                        if (widget.selectedIndex != 0) {
                          GoRouter.of(context)
                              .pushReplacementNamed(AppRouter.ownerReports);
                        }
                      },
                      child: Text(
                        "Owner",
                        style: AppStyle.styleBold25(context).copyWith(
                            fontFamily: 'Roboto',
                            color: widget.selectedIndex == 0
                                ? Colors.black
                                : const Color(0xFF5C5858),
                            fontWeight: widget.selectedIndex == 0
                                ? FontWeight.w700
                                : FontWeight.w400),
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: () {
                        // context.read<NavigationCubit>().navigateTo(11);
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => HospitalReport()));
                        // Navigator.pushNamed(context, hospialReportsScreen);
                        // context.go(hospialReportsScreen);
                        if (widget.selectedIndex != 1) {
                          GoRouter.of(context)
                              .pushReplacementNamed(AppRouter.hospitalReports);
                        }
                      },
                      child: Text(
                        "Hospital",
                        style: AppStyle.styleBold25(context).copyWith(
                            fontFamily: 'Roboto',
                            color: widget.selectedIndex == 1
                                ? Colors.black
                                : const Color(0xFF5C5858),
                            fontWeight: widget.selectedIndex == 1
                                ? FontWeight.w700
                                : FontWeight.w400),
                      )),
                  const Expanded(
                    child: SizedBox(
                      width: 100,
                    ),
                  ),
                  Container(
                    width: 480,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      child: TextFormField(
                        style: AppStyle.styleRegular16(context)
                            .copyWith(color: Colors.black),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          hintText: "Search",
                          hintStyle: AppStyle.styleRegular16(context),
                          contentPadding: const EdgeInsets.all(8),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                      child: SizedBox(
                    width: 20,
                  )),
                  BlocBuilder<AddOwnerAndHospitalCubit,
                      AddOwnerAndHospitalState>(
                    builder: (context, state) {
                      if (state is GetAllOwnerSuccess) {
                        final usersList = state.users;

                        return InkWell(
                          onTap: () {
                            final data = [
                              [
                                "Username",
                                "Email",
                                "Phone",
                                "Address",
                                "National Id",
                                "Board ID"
                              ],
                              ...usersList.map((user) => [
                                    user.username ?? "",
                                    user.email ?? "",
                                    "+2${user.phone}" ?? "",
                                    user.address?? "",
                                    user.nationalId ?? "", 
                                    user.boardId ?? "",
                                  ]),
                            ];

                            downloadReportWeb(data,"Owners");
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.download,
                                size: 16,
                                color: Color(0xFF5C5858),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Download",
                                style: AppStyle.styleRegular16(context)
                                    .copyWith(fontFamily: "Roboto"),
                              )
                            ],
                          ),
                        );
                      }
                        if (state is GetAllEmergenciesSuccess) {
                        final emergenciesList = state.emergencies;

                        return InkWell(
                          onTap: () {
                            final data = [
                              [
                                "Name",
                                "Type",
                                "Email",
                                "Phone",
                                "Address",
                                "ID",
                                "longitude",
                                "latitude",
                                "number"
                              ],
                              ...emergenciesList.map((emergencies) => [
                                    emergencies.name ,
                                    emergencies.type ,
                                    emergencies.email ,
                                    emergencies.phone,
                                    emergencies.address,
                                    emergencies.id , 
                                    emergencies.longitude,
                                    emergencies.latitude,
                                    emergencies.number
                                  ]),
                            ];

                            downloadReportWeb(data,"Hospitals");
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.download,
                                size: 16,
                                color: Color(0xFF5C5858),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Download",
                                style: AppStyle.styleRegular16(context)
                                    .copyWith(fontFamily: "Roboto"),
                              )
                            ],
                          ),
                        );
                      }
                      return  InkWell(
                          onTap: () {
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.download,
                                size: 16,
                                color: Color(0xFF5C5858),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Download",
                                style: AppStyle.styleRegular16(context)
                                    .copyWith(fontFamily: "Roboto"),
                              )
                            ],
                          ),
                        );
                      
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
    );
  }
}

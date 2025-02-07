import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:admin_panel_app/constants/pages_name.dart';
import 'package:admin_panel_app/core/data/model/all_emergencies_model.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_and_hospital_cubit.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_and_hospital_state.dart';
import 'package:admin_panel_app/presentation/widgets/dialog_animation.dart';
import 'package:admin_panel_app/presentation/widgets/repoert_dialog_hospital.dart';
import 'package:admin_panel_app/presentation/widgets/report_hospital_editing_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportsHospitalInfo extends StatefulWidget {
  const ReportsHospitalInfo({super.key});

  @override
  State<ReportsHospitalInfo> createState() => _ReportsHospitalInfoState();
}

class _ReportsHospitalInfoState extends State<ReportsHospitalInfo> {
  List<AllEmergenciesModel> emergencies = [];

  @override
  void initState() {
    BlocProvider.of<AddOwnerAndHospitalCubit>(context).getAllEmergencies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddOwnerAndHospitalCubit, AddOwnerAndHospitalState>(
      listener: (context, state) {
        if (state is DeleteEmergencyLoading) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showLoadingDialog(context);
          });
        }
        if (state is DeleteEmergencySuccess) {
          // Navigator.pop(context);
          //  context.go(dashBoardScreen);
          Navigator.pushReplacementNamed(context, dashBoardScreen);
          String message = state.message;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(message),
              behavior: SnackBarBehavior.floating,
              margin:
                  const EdgeInsets.only(bottom: 680, left: 160, right: 160)));

          // BlocProvider.of<AddOwnerAndHospitalCubit>(context)
          //     .getAllEmergencies();

          // Navigator.pop(context);
        } else if (state is DeleteEmergencyError) {
          Navigator.pop(context);
          String message = state.errMessage;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(message),
              behavior: SnackBarBehavior.floating,
              margin:
                  const EdgeInsets.only(bottom: 680, left: 160, right: 160)));
        }
      },
      child: BlocBuilder<AddOwnerAndHospitalCubit, AddOwnerAndHospitalState>(
        builder: (context, state) {
          if (state is GetAllEmergenciesLoading) {
            // WidgetsBinding.instance.addPostFrameCallback((_) {
            //   showLoadingDialog(context);
            // });
          }

          if (state is GetAllEmergenciesSuccess) {
            // Navigator.pop(context);
            emergencies = state.emergencies;
          }

          if (state is GetAllEmergenciesError) {
            // Navigator.pop(context);
            String message = state.errMessage;

            return Center(child: Text(message));
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,
              ),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: emergencies.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SingleChildScrollView(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 100,
                                child: TextFormField(
                                  maxLines: null,
                                  initialValue: emergencies[index].name,
                                  style: AppStyle.styleRegular16(context)
                                      .copyWith(color: Colors.black),
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.done,
                                  decoration: const InputDecoration(
                                    prefixIconConstraints: BoxConstraints(
                                      minWidth: 0,
                                      minHeight: 0,
                                    ),
                                    enabled: false,
                                    // isDense: true,

                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    //
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                  ),
                                ),
                              ),
                              // const SizedBox(
                              //   width: 30,
                              // ),
                              Expanded(
                                child: SizedBox(
                                  width: 200,
                                  child: TextFormField(
                                    maxLines: null,
                                    initialValue: emergencies[index].email,
                                    style: AppStyle.styleRegular16(context)
                                        .copyWith(color: Colors.black),
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    decoration: const InputDecoration(
                                      prefixIconConstraints: BoxConstraints(
                                        minWidth: 0,
                                        minHeight: 0,
                                      ),
                                      enabled: false,
                                      // isDense: true,

                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none),

                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                    ),
                                  ),
                                ),
                              ),
                              // const SizedBox(
                              //   width: 30,
                              // ),
                              Expanded(
                                child: SizedBox(
                                  width: 250,
                                  child: TextFormField(
                                    initialValue:
                                        '${emergencies[index].number}',
                                    style: AppStyle.styleRegular16(context)
                                        .copyWith(color: Colors.black),
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    decoration: const InputDecoration(
                                      prefixIconConstraints: BoxConstraints(
                                        minWidth: 0,
                                        minHeight: 0,
                                      ),
                                      enabled: false,
                                      // isDense: true,

                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none),

                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                    ),
                                  ),
                                ),
                              ),
                              // const SizedBox(
                              //   width: 30,
                              // ),
                              Expanded(
                                child: SizedBox(
                                  width: 100,
                                  child: TextFormField(
                                    initialValue: emergencies[index].address,
                                    style: AppStyle.styleRegular16(context)
                                        .copyWith(color: Colors.black),
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    decoration: const InputDecoration(
                                      prefixIconConstraints: BoxConstraints(
                                        minWidth: 0,
                                        minHeight: 0,
                                      ),
                                      enabled: false,
                                      // isDense: true,

                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none),

                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                    ),
                                  ),
                                ),
                              ),
                              // const SizedBox(
                              //   width: 30,
                              // ),
                              Expanded(
                                child: SizedBox(
                                  width: 150,
                                  child: TextFormField(
                                    initialValue:
                                        '${emergencies[index].longitude}',
                                    style: AppStyle.styleRegular16(context)
                                        .copyWith(color: Colors.black),
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    decoration: const InputDecoration(
                                      prefixIconConstraints: BoxConstraints(
                                        minWidth: 0,
                                        minHeight: 0,
                                      ),
                                      enabled: false,
                                      // isDense: true,

                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none),

                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                    ),
                                  ),
                                ),
                              ),
                              // const SizedBox(
                              //   width: 30,
                              // ),
                              Expanded(
                                child: SizedBox(
                                  width: 200,
                                  child: TextFormField(
                                    initialValue:
                                        '${emergencies[index].latitude}',
                                    style: AppStyle.styleRegular16(context)
                                        .copyWith(color: Colors.black),
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    decoration: const InputDecoration(
                                      prefixIconConstraints: BoxConstraints(
                                        minWidth: 0,
                                        minHeight: 0,
                                      ),
                                      enabled: false,
                                      // isDense: true,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none),

                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                    ),
                                  ),
                                ),
                              ),
                              // const SizedBox(
                              //   width: 30,
                              // ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      showReportHospitalFormDialog(
                                        context,
                                        emergencies[index].type,
                                        emergencies[index].name,
                                        emergencies[index].email,
                                        emergencies[index].number,
                                        emergencies[index].phone,
                                        emergencies[index].address,
                                        emergencies[index].longitude,
                                        emergencies[index].latitude,
                                      );
                                    },
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              side: const BorderSide(
                                                  color: MyColors.premiumColor,
                                                  width: 0.3)),
                                          color: Colors.white),
                                      child: const Center(
                                          child: Icon(Icons.visibility,
                                              color: MyColors.premiumColor)),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ReportHospitalEditingInformation(
                                                    id: emergencies[index].id,
                                                  )));
                                    },
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              side: const BorderSide(
                                                  color: Colors.amber,
                                                  width: 0.3)),
                                          color: Colors.white),
                                      child: const Center(
                                          child: Icon(Icons.edit,
                                              color: Colors.amber)),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              scrollable: true,
                                              backgroundColor: Colors.white,
                                              title: Column(
                                                children: [
                                                  Text(
                                                    "Are you sure , You want to delete this account?",
                                                    style: AppStyle.styleBold20(
                                                            context)
                                                        .copyWith(
                                                            fontSize: 20,
                                                            color: MyColors
                                                                .premiumColor),
                                                  ),
                                                  const SizedBox(
                                                    height: 16,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          width: 50,
                                                          height: 30,
                                                          decoration:
                                                              ShapeDecoration(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              side: const BorderSide(
                                                                  color: Colors
                                                                      .amber,
                                                                  width: 0.3),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            color: Colors.white,
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "No",
                                                              style: AppStyle
                                                                      .styleBold20(
                                                                          context)
                                                                  .copyWith(
                                                                      fontSize:
                                                                          18,
                                                                      color: Colors
                                                                          .black),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),

                                                      /////////////////////////////
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);

                                                          BlocProvider.of<
                                                                      AddOwnerAndHospitalCubit>(
                                                                  context)
                                                              .deleteEmergency(
                                                                  emergencies[
                                                                          index]
                                                                      .id);
                                                        },
                                                        child: Container(
                                                          width: 50,
                                                          height: 30,
                                                          decoration:
                                                              ShapeDecoration(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            color: MyColors
                                                                .premiumColor,
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "Yes",
                                                              style: AppStyle
                                                                      .styleBold20(
                                                                          context)
                                                                  .copyWith(
                                                                      fontSize:
                                                                          18,
                                                                      color: Colors
                                                                          .white),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              side: const BorderSide(
                                                  color: Colors.red,
                                                  width: 0.3)),
                                          color: Colors.white),
                                      child: const Center(
                                          child: Icon(Icons.delete,
                                              color: Colors.red)),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Divider(
                            height: 0,
                          ),
                        )
                      ],
                    );
                  }),
            ),
          );
        },
      ),
    );
  }
}

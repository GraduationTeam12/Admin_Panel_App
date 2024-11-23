import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:admin_panel_app/presentation/models/report_hospital_info_model.dart';
import 'package:admin_panel_app/presentation/widgets/repoert_dialog_hospital.dart';
import 'package:flutter/material.dart';
 

class ReportsHospitalInfo extends StatefulWidget {
  const ReportsHospitalInfo({super.key});

  @override
  State<ReportsHospitalInfo> createState() => _ReportsHospitalInfoState();
}

class _ReportsHospitalInfoState extends State<ReportsHospitalInfo> {
  final List<ReportHospitalInfoModel> items = [
    ReportHospitalInfoModel(
        name: "Sama Saber",
        email: "sabersama992@gmail.com",
        id: "112433",
        firperson: "2533331",
        longitude: '12.11.55',
        latitude: "12.11.55"),
    ReportHospitalInfoModel(
        name: "Sama Saber",
        email: "sabersama992@gmail.com",
        id: "112433",
        firperson: "2533331",
        longitude: '12.11.55',
        latitude: "12.11.55"),
    ReportHospitalInfoModel(
        name: "Sama Saber",
        email: "sabersama992@gmail.com",
        id: "112433",
        firperson: "2533331",
        longitude: '12.11.55',
        latitude: "12.11.55"),
    ReportHospitalInfoModel(
        name: "Sama Saber",
        email: "sabersama992@gmail.com",
        id: "112433",
        firperson: "2533331",
        longitude: '12.11.55',
        latitude: "12.11.55"),
    ReportHospitalInfoModel(
        name: "Sama Saber",
        email: "sabersama992@gmail.com",
        id: "112433",
        firperson: "2533331",
        longitude: '12.11.55',
        latitude: "12.11.55"),
    ReportHospitalInfoModel(
        name: "Sama Saber",
        email: "sabersama992@gmail.com",
        id: "112433",
        firperson: "2533331",
        longitude: '12.11.55',
        latitude: "12.11.55"),
  ];

  @override
  Widget build(BuildContext context) {
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
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 100,
                            child: TextFormField(
                              initialValue: items[0].name,
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
                                initialValue: items[0].email,
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
                                initialValue: items[0].id,
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
                                initialValue: items[0].firperson,
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
                                initialValue: items[0].longitude,
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
                                initialValue: items[0].latitude,
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
                                      items[index].name,
                                      items[index].email,
                                      items[index].id
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
                                   
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          side: const BorderSide(
                                              color: Colors.amber, width: 0.3)),
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
                                                    MainAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      width: 50,
                                                      height: 30,
                                                      decoration:
                                                          ShapeDecoration(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          side:
                                                              const BorderSide(
                                                                  color: Colors
                                                                      .amber,
                                                                  width: 0.3),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
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
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        items.remove(
                                                            items[index]);
                                                      });

                                                      Navigator.pop(context);
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
                                                                  .circular(8),
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
                                                                  fontSize: 18,
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
                                              color: Colors.red, width: 0.3)),
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
                ),
              );
            }),
      ),
    );
  }
}

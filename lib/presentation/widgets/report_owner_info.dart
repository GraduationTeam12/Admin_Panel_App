import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/constants/colors.dart';
import 'package:admin_panel_app/constants/pages_name.dart';
import 'package:admin_panel_app/core/api/dio_consumer.dart';
import 'package:admin_panel_app/core/data/model/all_owners_model.dart';
import 'package:admin_panel_app/core/data/repo/auth_repo.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_and_hospital_cubit.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_and_hospital_state.dart';
import 'package:admin_panel_app/presentation/widgets/dialog_animation.dart';
import 'package:admin_panel_app/presentation/widgets/report_dialog_owner.dart';
import 'package:admin_panel_app/presentation/widgets/report_owner_editing_information.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportOwnerInfo extends StatefulWidget {
  const ReportOwnerInfo({super.key});

  @override
  State<ReportOwnerInfo> createState() => _ReportOwnerInfoState();
}

class _ReportOwnerInfoState extends State<ReportOwnerInfo> {
  List<Users> users = [];
  @override
  void initState() {
    BlocProvider.of<AddOwnerAndHospitalCubit>(context).getAllOwners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return 
       
         BlocListener<AddOwnerAndHospitalCubit, AddOwnerAndHospitalState>(
          listener: (context, state) {
            if (state is DeleteUserLoading) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showLoadingDialog(context);
              });
            }
            if (state is DeleteUserSuccess) {
              // Navigator.pop(context);
              // users.removeWhere((user) => user.id == users[0].id);
              Navigator.pushReplacementNamed(context, dashBoardScreen);
              String message = state.message;
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(message),
                  behavior: SnackBarBehavior.floating,
                  margin:
                      const EdgeInsets.only(bottom: 680, left: 160, right: 160)));
            } else if (state is DeleteUserError) {
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
              if (state is GetAllOwnerLoading) {
                MediaQuery.sizeOf(context).width < 800 ? null :
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showLoadingDialog(context);
                });
              }
        
              if (state is GetAllOwnerSuccess) {
                  MediaQuery.sizeOf(context).width < 800 ? null : Navigator.pop(context);
                users = state.users;
              }
        
              if (state is GetAllOwnerError) {
                Navigator.pop(context);
              }
        
              //
        
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
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SingleChildScrollView(
                              child: MediaQuery.sizeOf(context).width < 800
                                  ? SizedBox(
                                      height: 50,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 1,
                                          itemBuilder: (context, index) {
                                            return Row(
                                              // mainAxisAlignment:
                                              //     MainAxisAlignment.spaceAround,
                                              children: [
                                                SizedBox(
                                                  width: 100,
                                                  child: TextFormField(
                                                    initialValue:
                                                        users[index].username,
                                                    style: AppStyle.styleRegular16(
                                                            context)
                                                        .copyWith(
                                                            color: Colors.black),
                                                    keyboardType:
                                                        TextInputType.text,
                                                    textInputAction:
                                                        TextInputAction.done,
                                                    decoration:
                                                        const InputDecoration(
                                                      prefixIconConstraints:
                                                          BoxConstraints(
                                                        minWidth: 0,
                                                        minHeight: 0,
                                                      ),
                                                      enabled: false,
                                                      // isDense: true,
        
                                                      border: OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none),
                                                      //
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide.none),
                                                    ),
                                                  ),
                                                ),
                                                // const SizedBox(
                                                //   width: 30,
                                                // ),
                                                SizedBox(
                                                  width: 200,
                                                  child: TextFormField(
                                                    initialValue:
                                                        users[index].email,
                                                    style:
                                                        AppStyle.styleRegular16(
                                                                context)
                                                            .copyWith(
                                                                color:
                                                                    Colors.black),
                                                    keyboardType:
                                                        TextInputType.text,
                                                    textInputAction:
                                                        TextInputAction.done,
                                                    decoration:
                                                        const InputDecoration(
                                                      prefixIconConstraints:
                                                          BoxConstraints(
                                                        minWidth: 0,
                                                        minHeight: 0,
                                                      ),
                                                      enabled: false,
                                                      // isDense: true,
                                                
                                                      border: OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none),
                                                
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .white)),
                                                    ),
                                                  ),
                                                ),
                                                // const SizedBox(
                                                //   width: 30,
                                                // ),
                                                SizedBox(
                                                  width: 100,
                                                  child: TextFormField(
                                                    initialValue:
                                                        users[index].address,
                                                    style:
                                                        AppStyle.styleRegular16(
                                                                context)
                                                            .copyWith(
                                                                color:
                                                                    Colors.black),
                                                    keyboardType:
                                                        TextInputType.text,
                                                    textInputAction:
                                                        TextInputAction.done,
                                                    decoration:
                                                        const InputDecoration(
                                                      prefixIconConstraints:
                                                          BoxConstraints(
                                                        minWidth: 0,
                                                        minHeight: 0,
                                                      ),
                                                      enabled: false,
                                                      // isDense: true,
                                                
                                                      border: OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none),
                                                
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .white)),
                                                    ),
                                                  ),
                                                ),
                                                // const SizedBox(
                                                //   width: 30,
                                                // ),
                                                SizedBox(
                                                  width: 100,
                                                  child: TextFormField(
                                                    initialValue:
                                                        users[index].boardId,
                                                    style:
                                                        AppStyle.styleRegular16(
                                                                context)
                                                            .copyWith(
                                                                color:
                                                                    Colors.black),
                                                    keyboardType:
                                                        TextInputType.text,
                                                    textInputAction:
                                                        TextInputAction.done,
                                                    decoration:
                                                        const InputDecoration(
                                                      prefixIconConstraints:
                                                          BoxConstraints(
                                                        minWidth: 0,
                                                        minHeight: 0,
                                                      ),
                                                      enabled: false,
                                                      // isDense: true,
                                                
                                                      border: OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none),
                                                
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .white)),
                                                    ),
                                                  ),
                                                ),
                                                // const SizedBox(
                                                //   width: 30,
                                                // ),
                                                SizedBox(
                                                  width: 150,
                                                  child: TextFormField(
                                                    initialValue:
                                                        users[index].phone,
                                                    style:
                                                        AppStyle.styleRegular16(
                                                                context)
                                                            .copyWith(
                                                                color:
                                                                    Colors.black),
                                                    keyboardType:
                                                        TextInputType.text,
                                                    textInputAction:
                                                        TextInputAction.done,
                                                    decoration:
                                                        const InputDecoration(
                                                      prefixIconConstraints:
                                                          BoxConstraints(
                                                        minWidth: 0,
                                                        minHeight: 0,
                                                      ),
                                                      enabled: false,
                                                      // isDense: true,
                                                
                                                      border: OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none),
                                                
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .white)),
                                                    ),
                                                  ),
                                                ),
                                                // const SizedBox(
                                                //   width: 30,
                                                // ),
                                                SizedBox(
                                                  width: 200,
                                                  child: TextFormField(
                                                    initialValue: users[index]
                                                        .nationalId
                                                        .toString(),
                                                    style:
                                                        AppStyle.styleRegular16(
                                                                context)
                                                            .copyWith(
                                                                color:
                                                                    Colors.black),
                                                    keyboardType:
                                                        TextInputType.text,
                                                    textInputAction:
                                                        TextInputAction.done,
                                                    decoration:
                                                        const InputDecoration(
                                                      prefixIconConstraints:
                                                          BoxConstraints(
                                                        minWidth: 0,
                                                        minHeight: 0,
                                                      ),
                                                      enabled: false,
                                                      // isDense: true,
                                                      border: OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none),
                                                
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .white)),
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
                                                        showReportOwnerFormDialog(
                                                            context,
                                                            users[index].username,
                                                            users[index].email,
                                                            users[index].address,
                                                            users[index].phone,
                                                            users[index]
                                                                .nationalId
                                                                .toString(),
                                                            users[index].boardId);
                                                      },
                                                      child: Container(
                                                        width: 30,
                                                        height: 30,
                                                        decoration: ShapeDecoration(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                side: const BorderSide(
                                                                    color: MyColors
                                                                        .premiumColor,
                                                                    width: 0.3)),
                                                            color: Colors.white),
                                                        child: const Center(
                                                            child: Icon(
                                                                Icons.visibility,
                                                                color: MyColors
                                                                    .premiumColor)),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        // context
                                                        //     .read<NavigationCubit>()
                                                        //     .navigateTo(12);
        
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ReportOwnerEditingInformation(
                                                                      id: users[
                                                                              index]
                                                                          .id),
                                                            ));
                                                      },
                                                      child: Container(
                                                        width: 30,
                                                        height: 30,
                                                        decoration: ShapeDecoration(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                side: const BorderSide(
                                                                    color: Colors
                                                                        .amber,
                                                                    width: 0.3)),
                                                            color: Colors.white),
                                                        child: const Center(
                                                            child: Icon(Icons.edit,
                                                                color:
                                                                    Colors.amber)),
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
                                                              return BlocProvider
                                                                  .value(
                                                                value: BlocProvider
                                                                    .of<AddOwnerAndHospitalCubit>(
                                                                        context),
                                                                child: AlertDialog(
                                                                  scrollable: true,
                                                                  backgroundColor:
                                                                      Colors.white,
                                                                  title: Column(
                                                                    children: [
                                                                      Text(
                                                                        "Are you sure , You want to delete this account?",
                                                                        style: AppStyle.styleBold20(context).copyWith(
                                                                            fontSize:
                                                                                20,
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
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(
                                                                                  context);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width:
                                                                                  50,
                                                                              height:
                                                                                  30,
                                                                              decoration:
                                                                                  ShapeDecoration(
                                                                                shape:
                                                                                    RoundedRectangleBorder(
                                                                                  side: const BorderSide(color: Colors.amber, width: 0.3),
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                ),
                                                                                color:
                                                                                    Colors.white,
                                                                              ),
                                                                              child:
                                                                                  Center(
                                                                                child:
                                                                                    Text(
                                                                                  "No",
                                                                                  style: AppStyle.styleBold20(context).copyWith(fontSize: 18, color: Colors.black),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(
                                                                                  context);
                                                                              BlocProvider.of<AddOwnerAndHospitalCubit>(context)
                                                                                  .deleteUser(users[index].id);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width:
                                                                                  50,
                                                                              height:
                                                                                  30,
                                                                              decoration:
                                                                                  ShapeDecoration(
                                                                                shape:
                                                                                    RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                ),
                                                                                color:
                                                                                    MyColors.premiumColor,
                                                                              ),
                                                                              child:
                                                                                  Center(
                                                                                child:
                                                                                    Text(
                                                                                  "Yes",
                                                                                  style: AppStyle.styleBold20(context).copyWith(fontSize: 18, color: Colors.white),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
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
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                side:
                                                                    const BorderSide(
                                                                        color: Colors
                                                                            .red,
                                                                        width:
                                                                            0.3)),
                                                            color: Colors.white),
                                                        child: const Center(
                                                            child: Icon(
                                                                Icons.delete,
                                                                color: Colors.red)),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    )
                                                  ],
                                                )
                                              ],
                                            );
                                          }),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          child: TextFormField(
                                            initialValue: users[index].username,
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
                                              initialValue: users[index].email,
                                              style:
                                                  AppStyle.styleRegular16(context)
                                                      .copyWith(
                                                          color: Colors.black),
                                              keyboardType: TextInputType.text,
                                              textInputAction: TextInputAction.done,
                                              decoration: const InputDecoration(
                                                prefixIconConstraints:
                                                    BoxConstraints(
                                                  minWidth: 0,
                                                  minHeight: 0,
                                                ),
                                                enabled: false,
                                                // isDense: true,
        
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide.none),
        
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white)),
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
                                              initialValue: users[index].address,
                                              style:
                                                  AppStyle.styleRegular16(context)
                                                      .copyWith(
                                                          color: Colors.black),
                                              keyboardType: TextInputType.text,
                                              textInputAction: TextInputAction.done,
                                              decoration: const InputDecoration(
                                                prefixIconConstraints:
                                                    BoxConstraints(
                                                  minWidth: 0,
                                                  minHeight: 0,
                                                ),
                                                enabled: false,
                                                // isDense: true,
        
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide.none),
        
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white)),
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
                                              initialValue: users[index].boardId,
                                              style:
                                                  AppStyle.styleRegular16(context)
                                                      .copyWith(
                                                          color: Colors.black),
                                              keyboardType: TextInputType.text,
                                              textInputAction: TextInputAction.done,
                                              decoration: const InputDecoration(
                                                prefixIconConstraints:
                                                    BoxConstraints(
                                                  minWidth: 0,
                                                  minHeight: 0,
                                                ),
                                                enabled: false,
                                                // isDense: true,
        
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide.none),
        
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white)),
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
                                              initialValue: users[index].phone,
                                              style:
                                                  AppStyle.styleRegular16(context)
                                                      .copyWith(
                                                          color: Colors.black),
                                              keyboardType: TextInputType.text,
                                              textInputAction: TextInputAction.done,
                                              decoration: const InputDecoration(
                                                prefixIconConstraints:
                                                    BoxConstraints(
                                                  minWidth: 0,
                                                  minHeight: 0,
                                                ),
                                                enabled: false,
                                                // isDense: true,
        
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide.none),
        
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white)),
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
                                              initialValue: users[index]
                                                  .nationalId
                                                  .toString(),
                                              style:
                                                  AppStyle.styleRegular16(context)
                                                      .copyWith(
                                                          color: Colors.black),
                                              keyboardType: TextInputType.text,
                                              textInputAction: TextInputAction.done,
                                              decoration: const InputDecoration(
                                                prefixIconConstraints:
                                                    BoxConstraints(
                                                  minWidth: 0,
                                                  minHeight: 0,
                                                ),
                                                enabled: false,
                                                // isDense: true,
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide.none),
        
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white)),
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
                                                showReportOwnerFormDialog(
                                                    context,
                                                    users[index].username,
                                                    users[index].email,
                                                    users[index].address,
                                                    users[index].phone,
                                                    users[index]
                                                        .nationalId
                                                        .toString(),
                                                    users[index].boardId);
                                              },
                                              child: Container(
                                                width: 30,
                                                height: 30,
                                                decoration: ShapeDecoration(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                5),
                                                        side: const BorderSide(
                                                            color: MyColors
                                                                .premiumColor,
                                                            width: 0.3)),
                                                    color: Colors.white),
                                                child: const Center(
                                                    child: Icon(Icons.visibility,
                                                        color:
                                                            MyColors.premiumColor)),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                // context
                                                //     .read<NavigationCubit>()
                                                //     .navigateTo(12);
        
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          BlocProvider(
                                                        create: (context) =>
                                                            AddOwnerAndHospitalCubit(
                                                                AuthRepository(
                                                                    apiConsumer:
                                                                        DioConsumer(
                                                                            dio:
                                                                                Dio()))),
                                                        child:
                                                            ReportOwnerEditingInformation(
                                                                id: users[index]
                                                                    .id),
                                                      ),
                                                    ));
                                              },
                                              child: Container(
                                                width: 30,
                                                height: 30,
                                                decoration: ShapeDecoration(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                5),
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
                                                      return BlocProvider.value(
                                                        value: BlocProvider.of<
                                                                AddOwnerAndHospitalCubit>(
                                                            context),
                                                        child: AlertDialog(
                                                          scrollable: true,
                                                          backgroundColor:
                                                              Colors.white,
                                                          title: Column(
                                                            children: [
                                                              Text(
                                                                "Are you sure , You want to delete this account?",
                                                                style: AppStyle
                                                                        .styleBold20(
                                                                            context)
                                                                    .copyWith(
                                                                        fontSize:
                                                                            20,
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
                                                                    child:
                                                                        Container(
                                                                      width: 50,
                                                                      height: 30,
                                                                      decoration:
                                                                          ShapeDecoration(
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          side: const BorderSide(
                                                                              color: Colors
                                                                                  .amber,
                                                                              width:
                                                                                  0.3),
                                                                          borderRadius:
                                                                              BorderRadius.circular(
                                                                                  8),
                                                                        ),
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      child: Center(
                                                                        child: Text(
                                                                          "No",
                                                                          style: AppStyle.styleBold20(context).copyWith(
                                                                              fontSize:
                                                                                  18,
                                                                              color:
                                                                                  Colors.black),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      Navigator.pop(
                                                                          context);
                                                                      BlocProvider.of<
                                                                                  AddOwnerAndHospitalCubit>(
                                                                              context)
                                                                          .deleteUser(
                                                                              users[index]
                                                                                  .id);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: 50,
                                                                      height: 30,
                                                                      decoration:
                                                                          ShapeDecoration(
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(
                                                                                  8),
                                                                        ),
                                                                        color: MyColors
                                                                            .premiumColor,
                                                                      ),
                                                                      child: Center(
                                                                        child: Text(
                                                                          "Yes",
                                                                          style: AppStyle.styleBold20(context).copyWith(
                                                                              fontSize:
                                                                                  18,
                                                                              color:
                                                                                  Colors.white),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
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
                                                            BorderRadius.circular(
                                                                5),
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

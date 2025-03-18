 import 'dart:developer';

import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/core/data/model/user_model.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_and_hospital_cubit.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_and_hospital_state.dart';
import 'package:admin_panel_app/presentation/widgets/custom_container.dart';
import 'package:admin_panel_app/presentation/widgets/custom_drawer.dart';
import 'package:admin_panel_app/presentation/widgets/dialog_animation.dart';
import 'package:admin_panel_app/presentation/widgets/report_information_editing_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportOwnerEditingInformation extends StatefulWidget {
  const ReportOwnerEditingInformation({super.key, required this.id});

  final String id;

  @override
  State<ReportOwnerEditingInformation> createState() =>
      _ReportOwnerEditingInformationState();
}

class _ReportOwnerEditingInformationState
    extends State<ReportOwnerEditingInformation> {
  List<UserModel> user = [];

  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController addressController;
  late TextEditingController ageController;
  late TextEditingController phoneController;
  late TextEditingController nationalIdController;

  @override
  void initState() {
    super.initState();

    userNameController = TextEditingController();
    emailController = TextEditingController();
    addressController = TextEditingController();
    ageController = TextEditingController();
    phoneController = TextEditingController();
    nationalIdController = TextEditingController();

    BlocProvider.of<AddOwnerAndHospitalCubit>(context).getUser(widget.id);
  }

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    addressController.dispose();
    ageController.dispose();
    phoneController.dispose();
    nationalIdController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MediaQuery.sizeOf(context).width < 800
          ? Colors.white
          : const Color.fromRGBO(217, 217, 217, 0.7),
      body: Row(
        children: [
            Expanded(
              flex: 1,
              child: CustomDrawer(
                  activeIndex: 4,
                  onTap: (index) {
                    log(index.toString());
                    // if (activeIndex != index) {
                    //   setState(() {
                    //     activeIndex = index;
                    //   });
                    // }
                  })),
          Expanded(
            flex: 4,
            child: BlocConsumer<AddOwnerAndHospitalCubit, AddOwnerAndHospitalState>(
              listener: (context, state) {
                if (state is GetUserSuccess) {
                  user = state.user;
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                return BlocBuilder<AddOwnerAndHospitalCubit, AddOwnerAndHospitalState>(
                    builder: (context, state) {
                   
            
                  if (state is GetUserLoading) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      showLoadingDialog(context);
                    });
                  }
            
                    
            
                  if (user.isEmpty) {
                    return Center(
                      child: Text(
                        "",
                        style:
                            AppStyle.styleSemiBold25(context).copyWith(fontSize: 30),
                      ),
                    );
                  }
            
                  userNameController.text = user[0].username;
                  emailController.text = user[0].email;
                  addressController.text = user[0].address;
                  ageController.text = user[0].age.toString();
                  phoneController.text = user[0].phone;
                  nationalIdController.text = user[0].nationalId.toString();
            
                  return MediaQuery.sizeOf(context).width < 800
                      ? SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: user[0].avatarUrl == null ? const AssetImage('assets/images/auth_images/person_image.jpeg') : NetworkImage(user[0].avatarUrl!),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        spreadRadius: 0,
                                        offset: Offset(0, 4),
                                        blurRadius: 4,
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ReportInformationEditingFields(
                                  id: widget.id,
                                  userNameCotroller: userNameController,
                                  ageCotroller: ageController,
                                  emailCotroller: emailController,
                                  nationalIdCotroller: nationalIdController,
                                  addressCotroller: addressController,
                                  phoneCotroller: phoneController,
                                )
                              ],
                            ),
                          ),
                        )
                      : CustomContainer(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.sizeOf(context).width < 800 ? 0 : 90,
                                vertical: 30),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: user[0].avatarUrl == null ? const AssetImage('assets/images/auth_images/person_image.jpeg') : NetworkImage(user[0].avatarUrl!),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x3F000000),
                                          spreadRadius: 0,
                                          offset: Offset(0, 4),
                                          blurRadius: 4,
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ReportInformationEditingFields(
                                    id: widget.id,
                                    userNameCotroller: userNameController,
                                    ageCotroller: ageController,
                                    emailCotroller: emailController,
                                    nationalIdCotroller: nationalIdController,
                                    addressCotroller: addressController,
                                    phoneCotroller: phoneController,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
            
                  // return const Text('');
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

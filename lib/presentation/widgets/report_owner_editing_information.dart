import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/core/api/dio_consumer.dart';
import 'package:admin_panel_app/core/data/model/user_model.dart';
import 'package:admin_panel_app/core/data/repo/auth_repo.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_cubit.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_state.dart';
import 'package:admin_panel_app/presentation/widgets/custom_container.dart';
import 'package:admin_panel_app/presentation/widgets/dialog_animation.dart';
import 'package:admin_panel_app/presentation/widgets/report_information_editing_fields.dart';
import 'package:dio/dio.dart';
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

    BlocProvider.of<AddOwnerCubit>(context).getUser(widget.id);
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
      backgroundColor: const Color.fromRGBO(217, 217, 217, 0.7),
      body: BlocBuilder<AddOwnerCubit, AddOwnerState>(
        builder: (context, state) {
          if (state is GetUserLoading) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showLoadingDialog(context);
            });
          }

          if (state is GetUserSuccess) {
            Navigator.pop(context);

            user = state.user;

            if (user.isEmpty) {
              return Center(
                child: Text(
                  "No owners found in the system",
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

            return CustomContainer(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 90, vertical: 30),
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
                            image: NetworkImage(user[0].avatarUrl),
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
                      BlocProvider(
                        create: (context) => AddOwnerCubit(AuthRepository(
                            apiConsumer: DioConsumer(dio: Dio()))),
                        child: ReportInformationEditingFields(
                          id: widget.id,
                          userNameCotroller: userNameController,
                          ageCotroller: ageController,
                          emailCotroller: emailController,
                          nationalIdCotroller: nationalIdController,
                          addressCotroller: addressController,
                          phoneCotroller: phoneController,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          return const Text('');
        },
      ),
    );
  }
}

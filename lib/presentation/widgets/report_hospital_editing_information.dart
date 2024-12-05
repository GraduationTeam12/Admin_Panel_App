import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/core/data/model/emergency_model.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_and_hospital_cubit.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_and_hospital_state.dart';
import 'package:admin_panel_app/presentation/widgets/custom_container.dart';
import 'package:admin_panel_app/presentation/widgets/dialog_animation.dart';
import 'package:admin_panel_app/presentation/widgets/report_hospital_editing_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportHospitalEditingInformation extends StatefulWidget {
  const ReportHospitalEditingInformation({super.key, required this.id});

  final String id;

  @override
  State<ReportHospitalEditingInformation> createState() =>
      _ReportHospitalEditingInformationState();
}

class _ReportHospitalEditingInformationState
    extends State<ReportHospitalEditingInformation> {
  List<EmergencyModel> emergency = [];

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController addressController;
  late TextEditingController numberController;
  late TextEditingController phoneController;
  late TextEditingController typeController;
  late TextEditingController longitudeController;
  late TextEditingController latitudeController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController();
    emailController = TextEditingController();
    addressController = TextEditingController();
    numberController = TextEditingController();
    phoneController = TextEditingController();
    typeController = TextEditingController();
    longitudeController = TextEditingController();
    latitudeController = TextEditingController();

    BlocProvider.of<AddOwnerAndHospitalCubit>(context).getEmergency(widget.id);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    numberController.dispose();
    typeController.dispose();
    phoneController.dispose();
    longitudeController.dispose();
    latitudeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xB1D9D9D9),
      body: BlocConsumer<AddOwnerAndHospitalCubit, AddOwnerAndHospitalState>(
        listener: (context, state) {
          // if (state is GetAllEmergenciesError) {
          //   showDialog(
          //     context: context,
          //     builder: (context) => AlertDialog(
          //       title: const Text("Error"),
          //       content: Text(state.errMessage),
          //       actions: <Widget>[
          //         TextButton(
          //           onPressed: () {
          //             Navigator.pop(context);
          //           },
          //           child: const Text("Ok"),
          //         )
          //       ],
          //     ),
          //   );
          // }

          if (state is GetEmergencySuccess) {
            emergency = state.emergency;

            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return BlocBuilder<AddOwnerAndHospitalCubit,
              AddOwnerAndHospitalState>(
            builder: (context, state) {
              if (state is GetEmergencyLoading) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showLoadingDialog(context);
                });
              }

              // if (state is GetEmergencySuccess) {
                // Navigator.pop(context);

                // emergency = state.emergency;

                if (emergency.isEmpty) {
                  return Center(
                    child: Text(
                      "",
                      style: AppStyle.styleSemiBold25(context)
                          .copyWith(fontSize: 30),
                    ),
                  );
                }
                typeController.text = emergency[0].type;
                nameController.text = emergency[0].name;
                emailController.text = emergency[0].email;
                addressController.text = emergency[0].address;
                numberController.text = emergency[0].number;
                phoneController.text = emergency[0].phone;
                longitudeController.text = emergency[0].longitude;
                latitudeController.text = emergency[0].latitude;

                return CustomContainer(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 90, vertical: 30),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReportHospitalInformationEditingFields(
                            id: widget.id,
                            typeCotroller: typeController,
                            nameCotroller: nameController,
                            numberCotroller: numberController,
                            emailCotroller: emailController,
                            addressCotroller: addressController,
                            phoneCotroller: phoneController,
                            longitudeCotroller: longitudeController,
                            latitudeCotroller: latitudeController,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              //}
              // return const Text('');
            },
          );
        },
      ),
    );
  }
}



import 'package:admin_panel_app/presentation/widgets/add_hospital_form.dart';
import 'package:admin_panel_app/presentation/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class AddHospital extends StatelessWidget {
  const AddHospital({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      color: const Color.fromARGB(255, 232, 226, 226),
      child: const CustomContainer(
        child: Padding(
          padding: EdgeInsets.only(top: 50),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    AddHospitalForm(),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
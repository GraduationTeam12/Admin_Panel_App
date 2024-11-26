import 'package:admin_panel_app/presentation/widgets/custom_container.dart';
import 'package:admin_panel_app/presentation/widgets/info_fields.dart';
import 'package:flutter/material.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
         
          Container(
            color: const Color.fromARGB(255, 232, 226, 226),
            child: const CustomContainer(
                    child: Padding(
            padding: EdgeInsets.only(top: 50),
            child: CustomScrollView(
              slivers: [SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InfoFields(),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ]),
                    ),
                  ),
          ),
    );
  }
}
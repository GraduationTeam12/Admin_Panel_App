import 'package:admin_panel_app/constants/app_images.dart';
import 'package:admin_panel_app/constants/app_style.dart';
import 'package:admin_panel_app/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DesktopLogin extends StatelessWidget {
  const DesktopLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF3D6498),
                Color.fromARGB(255, 214, 232, 240),
                // Color(0xFF81D4FA),
              ],
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 65),
              child: Container(
                width: 400,
                
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Color(0xFFFFFFFF)),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: CustomScrollView(slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          FittedBox(
                            child: Text(
                              "Welcome back!",
                              style: AppStyle.styleRegular40(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                68.0, 30, 68.0, 0),
                            child: SvgPicture.asset(
                              Assets.imagesAuthImagesLogin,
                            ),
                          ),
                          const LoginForm()
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

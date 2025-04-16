import 'package:admin_panel_app/constants/app_images.dart';
import 'package:admin_panel_app/presentation/widgets/dialog_info_admin.dart';
import 'package:admin_panel_app/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HeaderDesktop extends StatefulWidget {
  const HeaderDesktop({super.key, required this.title});
  final String title;

  @override
  State<HeaderDesktop> createState() => _HeaderDesktopState();
}

class _HeaderDesktopState extends State<HeaderDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      // height: MediaQuery.of(context).size.height * .11,
      decoration:   ShapeDecoration(
          shape: const RoundedRectangleBorder(),
          color: Colors.white,
           shadows: [
             BoxShadow(
               color: MediaQuery.sizeOf(context).width < 800? Colors.white : const Color(0x3F000000),
              spreadRadius: 0,
              offset: const Offset(0, 4),
              blurRadius: 4,
            )
          ]),
      child: Row(
        children: [
          const SizedBox(
            width: 30,
          ),
            Text(
            widget.title,
            style: const TextStyle(
                fontSize: 27, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          const Spacer(),
          SvgPicture.asset(
            Assets.imagesAuthImagesNotifcations,
            height: MediaQuery.sizeOf(context).width < 800?34:36,
            // height: MediaQuery.of(context).size.height * .06,
          ),
          const SizedBox(
            width: 25,
          ),
          GestureDetector(
            onTap: () {
              // context.read<NavigationCubit>().navigateTo(3);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const SurveyPage()));
                GoRouter.of(context).pushReplacementNamed(AppRouter.surveyPage);
            },
            child: SvgPicture.asset(
              Assets.imagesAuthImagesClarityFormLine,
              height: MediaQuery.sizeOf(context).width < 800?34:36,
              // height: MediaQuery.of(context).size.height * .06,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              showInfoAdminDialog(context);
            },
            child: Container(
              // height: MediaQuery.of(context).size.height * .08,
              // width: MediaQuery.of(context).size.height * .08,
              width: 50,
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),

              decoration:
                  const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    blurRadius: 4,
                    offset: Offset(0, 4))
              ]),
              child: ClipOval(
                  child: Image.asset(
                "assets/images/auth_images/person_image.jpeg",
                fit: BoxFit.cover,
              )),
            ),
          ),
            SizedBox(
            width: MediaQuery.sizeOf(context).width < 800? 0 :  40,
          ),
        ],
      ),
    );
  }
}

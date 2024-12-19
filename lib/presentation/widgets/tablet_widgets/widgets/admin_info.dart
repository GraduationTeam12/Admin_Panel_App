import 'package:admin_panel_app/constants/app_images.dart';
import 'package:admin_panel_app/core/logic/navigation_cubit/navigation_cubit.dart';
import 'package:admin_panel_app/presentation/widgets/dialog_info_admin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AdminInfo extends StatelessWidget {
  const AdminInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.imagesAuthImagesNotifcations,
          height: 34,
        ),
        const SizedBox(
          width: 25,
        ),
        GestureDetector(
          onTap: () {
            context.read<NavigationCubit>().navigateTo(3);
          },
          child: SvgPicture.asset(
            Assets.imagesAuthImagesClarityFormLine,
            height: 34,
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
            width: 50,
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
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
        const SizedBox(
          width: 20,
        )
      ],
    );
  }
}

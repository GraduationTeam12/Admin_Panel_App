// ignore_for_file: body_might_complete_normally_nullable

import 'package:admin_panel_app/constants/pages_name.dart';
import 'package:admin_panel_app/core/api/dio_consumer.dart';
import 'package:admin_panel_app/core/data/repo/auth_repo.dart';
import 'package:admin_panel_app/core/logic/login_cubit/login_cubit.dart';
import 'package:admin_panel_app/core/logic/navigation_cubit/navigation_cubit.dart';
import 'package:admin_panel_app/presentation/dash_board/add_owner.dart';
import 'package:admin_panel_app/presentation/dash_board/dash_board.dart';
import 'package:admin_panel_app/presentation/dash_board/login_page.dart';
import 'package:admin_panel_app/presentation/screens/splash_screen.dart';
import 'package:admin_panel_app/presentation/widgets/confirming_info.dart';
import 'package:admin_panel_app/presentation/widgets/desktop_otp.dart';
import 'package:admin_panel_app/presentation/widgets/get_information_body.dart';
import 'package:admin_panel_app/presentation/widgets/selecting_num_of_board.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generationRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPageScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(
                      AuthRepository(apiConsumer: DioConsumer(dio: Dio()))),
                  child: const LoginPage(),
                ));

      case dashBoardScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => NavigationCubit(),
                  child: const DashBoard(),
                ));

      case addOwnerScreen:
        return MaterialPageRoute(builder: (context)=> const AddOwner());

      case otpOwnerScreen:
        return MaterialPageRoute(builder: (context)=> const DesktopOtp());

      case infoOwnerScreen:
        return MaterialPageRoute(builder: (context)=> const GetInformationBody());

      case numOfBoardOwnerScreen:
        return MaterialPageRoute(builder: (context)=> const SelectingNumOfBoard());

      case confirmOwnerScreen:
        return MaterialPageRoute(builder: (context)=> const ConfirmingInfo());

      case splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}

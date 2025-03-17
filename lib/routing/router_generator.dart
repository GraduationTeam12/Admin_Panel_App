import 'package:admin_panel_app/core/api/dio_consumer.dart';
import 'package:admin_panel_app/core/api/end_points.dart';
import 'package:admin_panel_app/core/cache/cache_helper.dart';
import 'package:admin_panel_app/core/data/repo/repo_implementation.dart';
import 'package:admin_panel_app/core/logic/login_cubit/login_cubit.dart';
import 'package:admin_panel_app/presentation/dash_board/dash_board.dart';
import 'package:admin_panel_app/presentation/dash_board/login_page.dart';
import 'package:admin_panel_app/presentation/screens/splash_screen.dart';
import 'package:admin_panel_app/routing/app_router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final token = CacheHelper().getData(key: ApiKeys.token);

class RouterGenerator {
  static GoRouter mainRouting = GoRouter(
      errorBuilder: (context, state) {
        return Scaffold(
          body: Center(
            child: Text(state.error.toString()),
          ),
        );
      },
      initialLocation:
          token == null ? AppRouter.splashScreen : AppRouter.dashBoardScreen,
      routes: [
        GoRoute(
          path: AppRouter.loginPageScreen,
          name: AppRouter.loginPageScreen,
          builder: (context, state) => BlocProvider(
            create: (context) => LoginCubit(
                RepositoryImplementation(apiConsumer: DioConsumer(dio: Dio()))),
            child: const LoginPage(),
          ),
        ),
        GoRoute(
          path: AppRouter.splashScreen,
          name: AppRouter.splashScreen,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: AppRouter.dashBoardScreen,
          name: AppRouter.dashBoardScreen,
          builder: (context, state) => const DashBoard(),
        ),
      ]);
}

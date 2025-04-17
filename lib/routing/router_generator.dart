import 'package:admin_panel_app/core/api/dio_consumer.dart';
import 'package:admin_panel_app/core/api/end_points.dart';
import 'package:admin_panel_app/core/cache/cache_helper.dart';
import 'package:admin_panel_app/core/data/repo/repo_implementation.dart';
import 'package:admin_panel_app/core/logic/login_cubit/login_cubit.dart';
import 'package:admin_panel_app/presentation/dash_board/danger_zones.dart';
import 'package:admin_panel_app/presentation/dash_board/dash_board.dart';
import 'package:admin_panel_app/presentation/dash_board/hospital_report.dart';
import 'package:admin_panel_app/presentation/dash_board/login_page.dart';
import 'package:admin_panel_app/presentation/dash_board/owner_reports.dart';
import 'package:admin_panel_app/presentation/dash_board/support_page.dart';
import 'package:admin_panel_app/presentation/screens/splash_screen.dart';
import 'package:admin_panel_app/presentation/widgets/add_hospital.dart';
import 'package:admin_panel_app/presentation/widgets/add_owner.dart';
import 'package:admin_panel_app/presentation/widgets/confirming_info.dart';
import 'package:admin_panel_app/presentation/widgets/otp_owner.dart';
import 'package:admin_panel_app/presentation/widgets/report_hospital_editing_information.dart';
import 'package:admin_panel_app/presentation/widgets/report_owner_editing_information.dart';
import 'package:admin_panel_app/presentation/widgets/selecting_num_of_board.dart';
import 'package:admin_panel_app/presentation/widgets/survey_page.dart';
import 'package:admin_panel_app/presentation/widgets/user_information.dart';
import 'package:admin_panel_app/routing/app_router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// final token = CacheHelper().getData(key: ApiKeys.token);

class AuthNotifier extends ChangeNotifier {
  String? _token;

  AuthNotifier() {
    _initToken();
  }

  String? get token => _token;

  _initToken() {
    _token = CacheHelper().getData(key: ApiKeys.token);
    notifyListeners();
  }

  Future<void> setToken(String? token) async {
    _token = token;
    if (token != null) {
      await CacheHelper().saveData(key: ApiKeys.token, value: token);
    } else {
      await CacheHelper().removeData(key: ApiKeys.token);
      await CacheHelper().removeData(key: ApiKeys.id);
    }
    notifyListeners();
  }
}

class RouterGenerator {
  static final AuthNotifier authNotifier = AuthNotifier();
  static GoRouter mainRouting = GoRouter(
      refreshListenable: authNotifier._initToken(),
       
      // debugLogDiagnostics: true,
      redirect: (context, state) {
        final token = authNotifier.token;

        if (token == null &&
            state.uri.toString() != AppRouter.loginPageScreen) {
          return AppRouter.loginPageScreen;
        }

        if (token != null &&
            state.uri.toString() == AppRouter.loginPageScreen) {
          return AppRouter.dashBoardScreen;
        }

        return null;
      },
      errorBuilder: (context, state) {
        return Scaffold(
          body: Center(
            child: Text(state.error.toString()),
          ),
        );
      },
      initialLocation: CacheHelper().getData(key: ApiKeys.token) == null
          ? AppRouter.splashScreen
          : AppRouter.dashBoardScreen,
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
        GoRoute(
          path: AppRouter.dangerZones,
          name: AppRouter.dangerZones,
          builder: (context, state) => const DangerZones(),
        ),
        // GoRoute(
        //     path: AppRouter.overView,
        //     name: AppRouter.overView,
        //     builder: (context, state) => const DesktopDashboard()),

        GoRoute(
            path: AppRouter.ownerReports,
            name: AppRouter.ownerReports,
            builder: (context, state) => OwnerReports()),
        GoRoute(
            path: AppRouter.hospitalReports,
            name: AppRouter.hospitalReports,
            builder: (context, state) => HospitalReport()),
        GoRoute(
            path: AppRouter.support,
            name: AppRouter.support,
            builder: (context, state) => SupportPage()),
        GoRoute(
            path: AppRouter.addOwner,
            name: AppRouter.addOwner,
            builder: (context, state) => AddOwner()),
        GoRoute(
            path: AppRouter.otpOwner,
            name: AppRouter.otpOwner,
            builder: (context, state) => OtpOwner()),
        GoRoute(
            path: AppRouter.userInfo,
            name: AppRouter.userInfo,
            builder: (context, state) => UserInformation()),
        GoRoute(
            path: AppRouter.numOfBoard,
            name: AppRouter.numOfBoard,
            builder: (context, state) => SelectingNumOfBoard()),
        GoRoute(
            path: AppRouter.confirmingInfo,
            name: AppRouter.confirmingInfo,
            builder: (context, state) => ConfirmingInfo()),
        GoRoute(
            path: AppRouter.addHospital,
            name: AppRouter.addHospital,
            builder: (context, state) => AddHospital()),
        GoRoute(
            path: AppRouter.surveyPage,
            name: AppRouter.surveyPage,
            builder: (context, state) => SurveyPage()),
        GoRoute(
            path: '${AppRouter.updateUserInfo}:id', //AppRouter.updateUserInfo,
            name: AppRouter.updateUserInfo,
            builder: (context, state) {
              // final extra = state.extra as Map<String, dynamic>?;
              final id = state.pathParameters['id']!;
              return ReportOwnerEditingInformation(
                id: id,
              );
            }),

        GoRoute(
            path: '${AppRouter.updateHospitalInfo}:id',
            name: AppRouter.updateHospitalInfo,
            builder: (context, state) {
              // final extra = state.extra as Map<String, dynamic>?;
              final id = state.pathParameters['id']!;
              return ReportHospitalEditingInformation(
                id: id,
              );
            })
      ]);
}

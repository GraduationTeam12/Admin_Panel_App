import 'package:admin_panel_app/core/api/dio_consumer.dart';
import 'package:admin_panel_app/core/api/end_points.dart';
import 'package:admin_panel_app/core/cache/cache_helper.dart';
import 'package:admin_panel_app/core/data/repo/repo_implementation.dart';
import 'package:admin_panel_app/core/logic/add_owner_cubit/add_owner_and_hospital_cubit.dart';
import 'package:admin_panel_app/core/logic/analysis_cubit/analysis_cubit.dart';
import 'package:admin_panel_app/core/logic/logout_cubit/logout_cubit.dart';
import 'package:admin_panel_app/firebase_options.dart';
import 'package:admin_panel_app/routing/router_generator.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  CacheHelper().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // HydratedBloc.storage = await HydratedStorage.build(
  //   storageDirectory: kIsWeb
  //       ? HydratedStorage.webStorageDirectory
  //       : await getApplicationDocumentsDirectory(),
  // );
  runApp(MultiBlocProvider(
    providers: [
      // BlocProvider(
      //   create: (context) => NavigationCubit(),
      // ),
      BlocProvider(
        create: (context) => AddOwnerAndHospitalCubit(
            RepositoryImplementation(apiConsumer: DioConsumer(dio: Dio()))),
      ),
      BlocProvider(
        create: (context) => AnalysisCubit(
            RepositoryImplementation(apiConsumer: DioConsumer(dio: Dio()))),
      ),
      BlocProvider(
        create: (context) => LogoutCubit(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });

  final token = CacheHelper().getData(key: ApiKeys.token);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Admin App',
      routerConfig: RouterGenerator.mainRouting,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // onGenerateRoute: appRouter.generationRoute,
      // initialRoute: token == null ? splashScreen : dashBoardScreen,
      // home:  const ConfirmingInfo(),
    );
  }
}

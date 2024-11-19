import 'package:admin_panel_app/constants/pages_name.dart';
import 'package:admin_panel_app/core/cache/cache_helper.dart';
import 'package:admin_panel_app/firebase_options.dart';
import 'package:admin_panel_app/routing.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    CacheHelper().init();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
     );
    runApp(  MyApp(appRouter: AppRouter(),));
 }

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: appRouter.generationRoute,
      initialRoute: loginPageScreen,
    );
  }
}

 
 
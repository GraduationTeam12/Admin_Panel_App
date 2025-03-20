// ignore_for_file: use_build_context_synchronously

import 'package:admin_panel_app/constants/app_flow.dart';
import 'package:admin_panel_app/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
 

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
        GoRouter.of(context).pushReplacementNamed(AppRouter.loginPageScreen);
        // html.window.history.pushState({}, '', '');
        //   html.window.onPopState.listen((e) {
        //     html.window.history.pushState({}, '', '');
        //   });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(61, 100, 152, 1), // rgba(61,100,152,1)
              Color.fromRGBO(250, 250, 250, 1), // rgba(250,250,250,1)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Lottie.asset(AppFlow.flowSplashScreen, repeat: false),
      ),
    );
  }
}

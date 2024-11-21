import 'package:admin_panel_app/presentation/widgets/adaptive_layout.dart';
import 'package:admin_panel_app/presentation/widgets/desktop_login.dart';
import 'package:admin_panel_app/presentation/widgets/mobile_widgets/mobile_login.dart';
import 'package:admin_panel_app/presentation/widgets/tablet_widgets/tablet_login.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AdaptiveLayout(
        mobileLayout: (context) => const MobileLogin(),
        tabletLayout: (context) => const TabletLogin(),
        desktopLayout: (context) => const DesktopLogin(),
      ),
    );
  }
}

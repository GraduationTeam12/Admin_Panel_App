// ignore_for_file: body_might_complete_normally_nullable

import 'package:admin_panel_app/constants/pages_name.dart';
import 'package:admin_panel_app/presentation/dash_board/login_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generationRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPageScreen:
        return MaterialPageRoute(builder: (context)=> const LoginPage());
    }
  }
}

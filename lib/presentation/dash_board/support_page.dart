import 'package:admin_panel_app/presentation/widgets/selecting_readed_or_inreaded.dart';
import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
            SelectingReadedOrInreaded()
        ],
      ),
    );
  }
}
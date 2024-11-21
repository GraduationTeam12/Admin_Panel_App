import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   const CustomTextField({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return TextFormField();
  }
}

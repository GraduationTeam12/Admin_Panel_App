// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DrawerItemModel {
  final String title;
  final String image;
  final String imageActive;
  final VoidCallback onTap;
  const DrawerItemModel({
    required this.title,
    required this.image,
    required this.imageActive,
    required this.onTap,
  });
}

import 'package:flutter/material.dart';

abstract class AppStyle {
  static TextStyle styleBold17(BuildContext context) {
    return  TextStyle(
      color: const Color(0xFFFAFAFA),
      fontSize: getResponsiveFontSize(context , fontSize: 17),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold16(BuildContext context) {
    return  TextStyle(
      color: const Color(0xFF5C5858),
      fontSize: getResponsiveFontSize(context , fontSize: 16),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold20(BuildContext context) {
    return  TextStyle(
      color: const Color(0xFF5C5858),
      fontSize: getResponsiveFontSize(context , fontSize: 20),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold25(BuildContext context) {
    return  TextStyle(
      color: const Color(0xFF5C5858),
      fontSize: getResponsiveFontSize(context , fontSize: 25),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleRegular16(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF5C5858),
      fontSize: getResponsiveFontSize(context , fontSize: 16),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular12(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF5C5858),
      fontSize: getResponsiveFontSize(context , fontSize: 12),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF5C5858),
      fontSize: getResponsiveFontSize(context , fontSize: 16),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold18(BuildContext context) {
    return TextStyle(
      color: const Color(0xFFFFFFFF),
      fontSize: getResponsiveFontSize(context , fontSize: 18),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold25(BuildContext context) {
    return TextStyle(
      color: const Color(0xFFFFFFFF),
      fontSize: getResponsiveFontSize(context , fontSize: 25),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular25(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF5C5858),
      fontSize: getResponsiveFontSize(context , fontSize: 25),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular40(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF5C5858),
      fontSize: getResponsiveFontSize(context , fontSize: 40),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular35(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF3D6498),
      fontSize: getResponsiveFontSize(context , fontSize: 35),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular17(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF5C5858),
      fontSize: getResponsiveFontSize(context , fontSize: 17),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;

  if (width < 800) {
    return width / 550;
  } else if (width < 1200) {
    return width / 1000;
  } else {
    return width / 2200;
  }
}

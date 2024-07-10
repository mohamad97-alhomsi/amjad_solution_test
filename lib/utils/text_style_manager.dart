import 'package:amjad_solutions_test/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color? color, {
  double? height,
}) {
  return GoogleFonts.ubuntu(
      textStyle: TextStyle(
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
    color: color ?? Colors.black,
    height: height,
  ));
}



TextStyle regularTextStyle({
  required double fontSize,
  Color? color,
  double? height,
}) {
  return _getTextStyle(
    fontSize,
    FontWeight.w400,
    color,
    height: height,
  );
}

TextStyle mediumTextStyle({
  required double fontSize,
  Color? color,
  double? height,
}) {
  return _getTextStyle(
    fontSize,
    FontWeight.w500,
    color,
    height: 0.0.h,
  );
}
TextStyle semiBoldTextStyle({
  required double fontSize,
  Color? color,
  double? height,
}) {
  return _getTextStyle(
    fontSize,
    FontWeight.w600,
    color,
    height: 0.0.h,
  );
}


TextStyle boldTextStyle({
  required double fontSize,
  Color? color,
  double? height,
  
}) {
  return _getTextStyle(
    fontSize,
    FontWeight.w700,
    color,
    height: height,
  );
}


TextStyle extraBoldTextStyle({
  required double fontSize,
  Color? color,
  double? height,
}) {
  return _getTextStyle(
    fontSize,
    FontWeight.w900,
    color,
    height: height,
  );
}

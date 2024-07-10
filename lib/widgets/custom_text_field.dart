import 'package:amjad_solutions_test/constants/app_colors.dart';
import 'package:amjad_solutions_test/utils/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, required this.controller});
final String hintText;
final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2.h),
            blurRadius: 2,
            color: Color(0xff000000).withOpacity(0.15),
          )
        ]
      ),
      child:TextFormField(
        controller: controller,
        decoration: InputDecoration(  
          hintText: hintText,
          fillColor: Colors.white,
          filled: true,
          hintStyle: regularTextStyle(fontSize: 14,color: AppColors.hintColor),
          border: OutlineInputBorder(
            borderSide  : BorderSide.none,
            borderRadius: BorderRadius.circular(6.r),
          )
        ),
      ),
    );
  }
}
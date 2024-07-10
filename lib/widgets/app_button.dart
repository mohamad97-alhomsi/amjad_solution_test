import 'package:amjad_solutions_test/constants/app_colors.dart';
import 'package:amjad_solutions_test/utils/text_style_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';


class AppButton extends StatelessWidget {
  final String label;
final Color ?backgroundColor;
final Color ? textColor;

final void Function()onTap;
  const AppButton({
    Key? key,
   required this.label,
    required this.onTap,
    this.backgroundColor,
    this.textColor
    

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(vertical: 2.5.w),
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: 285.w,
          height: 50.h,
          decoration: BoxDecoration(
              color: backgroundColor?? AppColors.appBlue,
              border:  Border.all(color: AppColors.appBlue),
              borderRadius: BorderRadius.circular(8.r)),
          child: Text(
                label,
            style: boldTextStyle(fontSize: 14,color: textColor?? Colors.white)
            // color: textColor ?? AppColors.white,
          ),
        ),
      ),
    );
  }
}


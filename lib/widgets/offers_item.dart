import 'package:amjad_solutions_test/constants/app_colors.dart';
import 'package:amjad_solutions_test/constants/constants.dart';
import 'package:amjad_solutions_test/utils/text_style_manager.dart';
import 'package:amjad_solutions_test/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OffersItem extends StatelessWidget {
  const OffersItem({super.key, this.imageUrl});
final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      decoration: BoxDecoration(
                     image: DecorationImage(image: imageUrl ==null?AssetImage(AppConstants.offerImage): NetworkImage(imageUrl!),fit: BoxFit.cover),

      ),
      child: Container(
        decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.appBlue,width: 2),
                gradient:const LinearGradient(

              begin: Alignment.centerLeft,
               
              end: Alignment.centerRight, 
              colors: [
Color.fromRGBO(60, 60, 60, 1)
,Color.fromRGBO(74, 74, 74, 0)
              ],
            ),
              ),
        child: Stack(
          children: [
            
            // Container(
            //   // height: 150.h,
            //   decoration: ,
            // ),
            Positioned(
              right: 31.w,
              top: 10.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  
                  Container(
                  width: 62,
                  height: 62,
                  child: SvgPicture.asset(AppConstants.offerIcon),
                          ),
                          Text("OFF",style: semiBoldTextStyle(fontSize: 14,color: Colors.white,),)
                ],
              )),
              Positioned(
                right: 19.w,
                top: 112.h,
                child: InkWell(
            onTap: (){},
            child: Container(
              alignment: Alignment.center,
              width: 96.w,
              height: 21.h,
              decoration: BoxDecoration(
                  color:Colors.white ,
                  // border:  Border.all(color: AppColors.appBlue),
                  borderRadius: BorderRadius.circular(8.r)),
              child: Text(
                    "Details",
                style: semiBoldTextStyle(fontSize: 11,color:  AppColors.orange)
                // color: textColor ?? AppColors.white,
              ),
            ),
          )),
          Positioned(
            top: 88.h,
            child: Container(
              padding: EdgeInsets.only(left:21.w ),
              width: 173.w,height: 60.h,child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Special Offer",style: semiBoldTextStyle(fontSize: 14.sp,color: Colors.white),),
                        Text("Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed ",style: regularTextStyle(fontSize: 10.sp,color: Colors.white),maxLines: 2,overflow: TextOverflow.ellipsis,),
        
            ],
          ),))
          ],
        ),
      ),
    );
  }
}
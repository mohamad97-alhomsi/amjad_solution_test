import 'package:amjad_solutions_test/constants/app_colors.dart';
import 'package:amjad_solutions_test/constants/constants.dart';
import 'package:amjad_solutions_test/utils/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SalonCard extends StatelessWidget {
  const SalonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      color: Colors.white,
      child: Container(
        height: 172.h,
        width: 204.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Column(children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                                image: DecorationImage(image: AssetImage(AppConstants.salonImage),fit: BoxFit.cover)
              
                ),
                  height: 124.h,
                     
                child: Container(
                       decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  gradient: const LinearGradient(
                    
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                    Color.fromRGBO(44,44, 44, 0),
                    Color.fromRGBO(51,51, 51, 1),
                  ]),
                ),
                ),
              ),
                         Container(
                          margin: EdgeInsetsDirectional.only(start: 14,bottom: 6.h ),
                           child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,     
                             children: [
                               Text("Place Name",style: semiBoldTextStyle(fontSize: 13.sp,color: Colors.white,)  ),
                                                            Text("Damascus",style: regularTextStyle(fontSize: 8.sp,color: Colors.white,)  ),
                           
                             ],
                           ),
                         ), 

            ],
          ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        SvgPicture.asset(AppConstants.likeIcon),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Text(
                              "200 Likes",
                              style: regularTextStyle(
                                  fontSize: 10.sp, color: Color(0xff878787)),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        SvgPicture.asset(AppConstants.starIcon),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Text(
                              "4.2 (${20} Reviews)",
                              style: regularTextStyle(
                                  fontSize: 10.sp, color: Color(0xff878787)),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            )
        ],),
      ),
    );
  }
}
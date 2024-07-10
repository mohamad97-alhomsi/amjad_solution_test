import 'package:amjad_solutions_test/constants/app_colors.dart';
import 'package:amjad_solutions_test/constants/constants.dart';
import 'package:amjad_solutions_test/data/models/clinic_model.dart';
import 'package:amjad_solutions_test/utils/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

class ClinicCard extends StatelessWidget {
  const ClinicCard({super.key, required this.clinic});
  final Venue clinic;
  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      color: Colors.white,
      child: Container(
        height: 202.h,
        width: 260.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          // color: Colors.amber,
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            //? owner Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 27.dm,
                      height: 27.dm,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                AppConstants.clinicImage,
                              ),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      width: 100.w,
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${clinic.user?.name} ${clinic.user?.lastName}",
                              overflow: TextOverflow.ellipsis,
                              style: mediumTextStyle(fontSize: 10),
                            ),
                            Text(
                              "${clinic.city?.name}",
                              style: regularTextStyle(fontSize: 8),
                            )
                          ]),
                    )
                  ],
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "${clinic.specializationType}",
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 10.sp,
                          color: AppColors.orange,
                          decorationThickness: 3,
                          decorationColor: AppColors.orange,
                          decoration: TextDecoration.underline),
                    ))
              ],
            ),
            Container(
              height: 100.h,
              child: Row(
                children: [
                  //? image 1
                  Container(
                    margin: EdgeInsetsDirectional.only(
                      end: 10.w,
                    ),
                    width: 113.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        image: DecorationImage(
                            image: AssetImage(
                              AppConstants.clinic4,
                            ),
                            fit: BoxFit.cover)),
                  ),
                  //?
                  Container(
                    margin: EdgeInsetsDirectional.only(
                      end: 7.w,
                    ),
                    // width: 113.w,
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsetsDirectional.only(
                                  end: 4.w,
                                ),
                                width: 52.w,
                                height: 47.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          AppConstants.clinic3,
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                margin: EdgeInsetsDirectional.only(
                                    // end: 4.w,
                                    ),
                                width: 54.w,
                                height: 47.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          AppConstants.clinic3,
                                        ),
                                        fit: BoxFit.cover)),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.only(
                              top: 4.h,
                            ),
                            width: 112.w,
                            height: 49.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                image: DecorationImage(
                                    image: AssetImage(
                                      AppConstants.clinic1,
                                    ),
                                    fit: BoxFit.cover)),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 9.h),
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
                              "${clinic.likes} Likes",
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
                              "${clinic.rate} (${clinic.reviews} Reviews)",
                              style: regularTextStyle(
                                  fontSize: 10.sp, color: Color(0xff878787)),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "more Details",
                style: regularTextStyle(fontSize: 10, color: AppColors.orange),
              ),
            )
          ],
        ),
      ),
    );
  }
}

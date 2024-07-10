import 'package:amjad_solutions_test/constants/app_colors.dart';
import 'package:amjad_solutions_test/constants/constants.dart';
import 'package:amjad_solutions_test/data/cubits/clinic_cubit/clinic_cubit.dart';
import 'package:amjad_solutions_test/data/cubits/home_cubit/home_cubit.dart';
import 'package:amjad_solutions_test/utils/text_style_manager.dart';
import 'package:amjad_solutions_test/widgets/clinic_card.dart';
import 'package:amjad_solutions_test/widgets/offers_item.dart';
import 'package:amjad_solutions_test/widgets/salon_card.dart';
import 'package:amjad_solutions_test/widgets/shimmer_widgets/clinic_card_shimmer.dart';
import 'package:amjad_solutions_test/widgets/shimmer_widgets/offer_item_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomPaint(
              size: Size(500.w, 150.h),
              painter: RPSCustomPainter(),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.h, left: 27.w, right: 21.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 42.dm,
                        height: 42.dm,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                  AppConstants.clinicImage,
                                ),
                                fit: BoxFit.cover)),
                      ),
                      Text(
                        "Hi Rama",
                        style:
                            regularTextStyle(fontSize: 16, color: Colors.white),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(AppConstants.notificationIcon),
                      SvgPicture.asset(AppConstants.menuIcon)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
                         
                  
              sectionTitle(title: "Best Offers"),
              SizedBox(
                height: 150.h,
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is OfferLoadingState) {
                      return PageView.builder(
                          itemCount: 5,
                          itemBuilder: (_, index) {
                            return OfferItemShimmer();
                          });
                    }
                    if (state is OfferSuccessState) {
                      return PageView.builder(
                          itemCount: state.offersModel.offers!.length,
                          itemBuilder: (_, index) {
                            return OffersItem(
                              offerObject: state.offersModel.offers![index],
                            );
                          });
                    }
                    if (state is OfferErrorState) {
                      return Container(
                        height: 150.h,
                        child: Center(child: Text(state.error.toString())),
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),
              ),
              sectionTitle(title: "Cosmetic clinics"),
              SizedBox(
                  height: 220.h,
                  child: BlocBuilder<ClinicCubit, ClinicState>(
                    builder: (context, state) {
                      if (state is ClinicLoadingState) {
                        return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            separatorBuilder: (_, index) => SizedBox(
                                  width: 10.w,
                                ),
                            itemBuilder: (_, index) {
                              return ClinicCardShimmer();
                            });
                      }
                      if (state is ClinicSuccessState) {
                        return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                state.clinicModel.content!.venues!.length,
                            separatorBuilder: (_, index) => SizedBox(
                                  width: 10.w,
                                ),
                            itemBuilder: (_, index) {
                              return ClinicCard(
                                clinic:
                                    state.clinicModel.content!.venues![index],
                              );
                            });
                      }
                      if (state is ClinicErrorStateState) {
                        return Container(
                          height: 110.h,
                          child: Center(child: Text(state.error.toString())),
                        );
                      }
                      return SizedBox.shrink();
                    },
                  )),
              sectionTitle(title: "Salon"),
              SizedBox(
                  height: 205.h,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      separatorBuilder: (_, index) => SizedBox(
                            width: 10.w,
                          ),
                      itemBuilder: (_, index) {
                        return SalonCard();
                      }))
            ],
          ),
        ),
      ],
    )));
    

    
  }

  Widget sectionTitle({required String title}) {
    return Container(
        margin: EdgeInsets.only(bottom: 21.h, top: 25.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.merienda(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: AppColors.textColor)),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "See More",
                  style:
                      boldTextStyle(fontSize: 12.sp, color: AppColors.orange),
                ))
          ],
        ));
  }
}







class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(428, 0);
    path_0.lineTo(428, 142);
    path_0.cubicTo(280.5, 126.5, 247, 165, 0, 142);
    path_0.lineTo(0, 0);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff00A5BC).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

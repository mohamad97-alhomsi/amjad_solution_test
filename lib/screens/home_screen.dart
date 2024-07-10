import 'package:amjad_solutions_test/constants/app_colors.dart';
import 'package:amjad_solutions_test/utils/text_style_manager.dart';
import 'package:amjad_solutions_test/widgets/offers_item.dart';
import 'package:amjad_solutions_test/widgets/salon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 150.h,
        backgroundColor: AppColors.appBlue,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              sectionTitle(title: "Best Offers"),
              SizedBox(
                height: 150.h,
                child: PageView.builder(
                  itemCount: 5,
                  itemBuilder: (_,index){
                  return OffersItem();
                }),
              ),
                            sectionTitle(title: "Salon"),
                            
                            SizedBox(
                              height: 205.h,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                separatorBuilder: (_,index)=>SizedBox(width: 10.w,),
                                itemBuilder: (_,index){
                                return SalonCard();
                              }))

              
            ],
          ),
        ),
      ),
      
    );
  }
  
  Widget sectionTitle({required String title}) {
    return Container(
        margin: EdgeInsets.only(bottom: 21.h,top: 25.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: AppColors.textColor),
            ),
            TextButton(onPressed: (){}, child: Text("See More",style: boldTextStyle(fontSize: 12.sp,color: AppColors.orange),))
          ],
        ));
  }
}
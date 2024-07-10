import 'package:amjad_solutions_test/constants/app_colors.dart';
import 'package:amjad_solutions_test/constants/constants.dart';
import 'package:amjad_solutions_test/screens/home_screen.dart';
import 'package:amjad_solutions_test/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 2,
      
      length: 5,
      child: Scaffold(
        
        // appBar: AppBar(toolbarHeight: 150.h,),
        bottomNavigationBar: Container(
          height: 88.h
          ,
          padding: EdgeInsets.symmetric(vertical: 10),
          child: TabBar(
            overlayColor: WidgetStateProperty.all(Color(0xffF5F5F5)),
            indicatorColor: AppColors.orange,
            indicatorSize:TabBarIndicatorSize.tab ,
            tabs: [
                            Tab(
                      icon: SvgPicture.asset(
                      AppConstants.userIcon
                      
                      ),
                    ),
                    Tab(
                      icon: SvgPicture.asset(
                      AppConstants.heartIcon
                
                     
                      ),
                    ),
                    Tab(
                      icon: SvgPicture.asset(
                                          AppConstants.homeIcon
          
                        
                      ),
                    ),
                    Tab(
                      icon: SvgPicture.asset(
                                         AppConstants.cardIcon
          
                    
                      ),
                    ),
                    Tab(
                      icon: SvgPicture.asset(
                                          AppConstants.searchIcon
          
                       
                      ),
                    ),
                
          ],),
          
        ),
        body: TabBarView(children: [
          Container(),
          Container(),
        HomeScreen(),
          Container(),
          Container(),
        ]),
      ),
    );
  }
}

//  class AppBarClipper extends CustomClipper<Path>{
//   @override
//   Path getClip(Size size) {
//     final Path = pa
//   }
 
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     // TODO: implement shouldReclip
//     throw UnimplementedError();
//   }
    
//   }
import 'package:amjad_solutions_test/constants/app_colors.dart';
import 'package:amjad_solutions_test/constants/constants.dart';
import 'package:amjad_solutions_test/data/cubits/login_cubit/login_cubit.dart';
import 'package:amjad_solutions_test/data/models/login_model.dart';
import 'package:amjad_solutions_test/screens/main_layout.dart';
import 'package:amjad_solutions_test/utils/text_style_manager.dart';
import 'package:amjad_solutions_test/widgets/app_button.dart';
import 'package:amjad_solutions_test/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _phonNumberTextController = TextEditingController(text: "+963948858333");
  final _passwordTextController = TextEditingController(text: "password");
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (_, state) {
          if (state is LoginErrorState) {
            isLoading = false;
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Somthing wrong")));
          } else if (state is LoginSuccessState) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainLayout()));
          }
        },
        builder: (context, state) {
          if (state is LoginLoadingState) {
            isLoading = true;
          } else if (state is LoginErrorState) {
            isLoading = false;
          } else if (state is LoginSuccessState) {
            isLoading = false;
          }

          return ModalProgressHUD(
            inAsyncCall: isLoading,
            progressIndicator: CircularProgressIndicator(color: AppColors.orange,),
            child: Scaffold(
              body: SingleChildScrollView(
                  child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    height: 500,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              AppConstants.leafBottom,
                            ),
                            fit: BoxFit.cover)),
                    // color: Colors.red,
                    // AppConstants.leafTop,
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  AppConstants.leafTop,
                                ),
                                fit: BoxFit.cover)),
                        // color: Colors.amber,
                        // margin: EdgeInsets.only(bottom: 128),
                        height: 137,
                        child: Center(
                            child: SvgPicture.asset(AppConstants.appLogo)),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text("Welcome back!",
                                  style: mediumTextStyle(
                                      fontSize: 16.sp,
                                      color: Color(0xff4A4A4A))),
                            ),
                            Container(
                              child: Text(
                                " log in using your email account to continue us",
                                style: mediumTextStyle(
                                    fontSize: 16.sp, color: Color(0xff4A4A4A)),
                              ),
                              margin: EdgeInsets.only(bottom: 124.h),
                            ),
                            sectionTitle(title: "Mobile"),
                            Container(
                                margin: EdgeInsets.only(bottom: 36.h),
                                child: CustomTextField(
                                  controller: _phonNumberTextController,
                                  hintText: "Enter your number",
                                )),
                            sectionTitle(title: "Password"),
                            Container(
                                margin: EdgeInsets.only(bottom: 19.h),
                                child: CustomTextField(
                                  controller: _passwordTextController,
                                  hintText: "Eenter your password",
                                )),
                            Container(
                                margin: EdgeInsets.only(bottom: 169.h),
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () {},
                                    child: Text("Forget Password ?",
                                        style: mediumTextStyle(
                                            fontSize: 16,
                                            color: Color(0xff4A4A4A))))),
                            Container(
                                margin: EdgeInsets.only(bottom: 21.h),
                                child: AppButton(
                                    label: "SIGN IN",
                                    onTap: () {
                                      context.read<LoginCubit>().loginCubit(
                                          LoginModel(
                                              mobileNumber:
                                                  _phonNumberTextController
                                                      .text,
                                              password: _passwordTextController
                                                  .text));
                                    })),
                            Container(
                              margin: EdgeInsets.only(bottom: 80.sp),
                              alignment: Alignment.center,
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Guest",
                                    // textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14.sp,
                                        color: AppColors.orange,
                                        decorationThickness: 3,
                                        decorationColor: AppColors.orange,
                                        decoration: TextDecoration.underline),
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              )),
            ),
          );
        },
      ),
    );
  }

  Widget sectionTitle({required String title}) {
    return Container(
        margin: EdgeInsets.only(bottom: 10.h),
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: AppColors.textColor),
        ));
  }
}

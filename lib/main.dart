import 'package:amjad_solutions_test/screens/main_layout.dart';
import 'package:amjad_solutions_test/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(

      builder: (_,child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            
            scaffoldBackgroundColor: Colors.white,
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
          ),
          home:child ,
        );
        
      },
            child: LoginScreen(),
      
    );
  }
}



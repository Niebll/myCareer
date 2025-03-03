import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycareer_new/features/auth/page/login/login.dart';
import 'package:mycareer_new/features/auth/page/register/pengalaman_kerja_detail.dart';
import 'package:mycareer_new/features/auth/page/register/register.dart';
import 'package:mycareer_new/features/auth/page/register/upload_cv.dart';
import 'package:mycareer_new/features/on_boarding/page/on_boarding.dart';
import 'package:mycareer_new/features/splash_screen/page/splash_screen.dart';

import 'core/nav_bar/nav_bar.dart';
import 'core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Mengatur status bar agar transparan
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Status bar transparan
      statusBarIconBrightness: Brightness.dark, // Icon status bar gelap
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: AppThemeData.getThemeLight(),
          home: child,
        );
      },
      child: UploadCvPage(),
    );
  }
}

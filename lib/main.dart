import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycareer_new/core/bottom_nav/nav_bar.dart';
import 'package:mycareer_new/core/nav/nav.dart';
import 'package:mycareer_new/features/career_counsel/view/page/career_counsel.dart';
import 'package:mycareer_new/features/career_counsel/view/page/career_counsel_detail.dart';
import 'package:mycareer_new/features/career_counsel/view/page/career_counsel_detail_chat.dart';
import 'package:mycareer_new/features/career_counsel/view/page/career_counsel_detail_payment.dart';
import 'package:mycareer_new/features/career_counsel/view/page/career_counsel_list.dart';
import 'package:mycareer_new/features/career_hub/view/page/career_hub.dart';
import 'package:mycareer_new/features/chat_ai/chat_ai.dart';
import 'package:mycareer_new/features/home/view/page/home.dart';
import 'package:mycareer_new/features/job_pulse/page/job_pulse.dart';
import 'package:mycareer_new/features/job_pulse/page/job_pulse_detail.dart';
import 'package:mycareer_new/features/on_boarding/page/on_boarding.dart';
import 'package:mycareer_new/features/profile/view/page/profile.dart';
import 'package:mycareer_new/features/profile/view/page/profile_edit.dart';
import 'package:mycareer_new/features/profile/view/page/profile_stalker.dart';
import 'package:mycareer_new/features/profile/view/page/profile.dart';
import 'package:mycareer_new/features/profile/view/page/profile_upload_porto.dart';
import 'package:mycareer_new/features/scholar/view/page/scholar.dart';
import 'package:mycareer_new/features/scholar/view/page/scholar_detail.dart';
import 'package:mycareer_new/features/skill_quest/view/page/bootcamp_detail.dart';
import 'package:mycareer_new/features/skill_quest/view/page/bootcamp_detail_paid.dart';
import 'package:mycareer_new/features/skill_quest/view/page/bootcamp_detail_payment.dart';
import 'package:mycareer_new/features/skill_quest/view/page/skill_quest.dart';
import 'package:mycareer_new/features/skill_quest/view/widget/bootcamp.dart';
import 'package:mycareer_new/features/splash_screen/page/splash_screen.dart';

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

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    _,
  ) {
    runApp(MyApp());
  });
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
      child: SplashScreenPage(),
    );
  }
}

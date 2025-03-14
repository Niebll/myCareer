import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycareer_new/core/bottom_nav/nav_bar.dart';
import 'package:mycareer_new/core/nav/nav.dart';
import 'package:mycareer_new/core/theme/color_value.dart';
import 'package:mycareer_new/features/home/view/page/home.dart';

class RegisterEndPage extends StatefulWidget {
  const RegisterEndPage({Key? key}) : super(key: key);

  @override
  State<RegisterEndPage> createState() => _RegisterEndPageState();
}

class _RegisterEndPageState extends State<RegisterEndPage> {
  @override
  Widget build(BuildContext context) {
    //change status bar color
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness:
            Brightness.light, // Dark icons (for light backgrounds)
      ),
    );
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: ColorValue.primary90Color,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Terimakasih Telah",
              style: textTheme.titleMedium!.copyWith(color: Colors.white),
            ),
            Text(
              "Menyelesaikan Registrasi!",
              style: textTheme.titleMedium!.copyWith(color: Colors.white),
            ),
            SizedBox(height: 16.h),
            SvgPicture.asset(
              "assets/images/auth/register_end.svg",
              height: 279.h,
              width: 279.w,
            ),
            SizedBox(height: 16.h),
            SizedBox(
              width: 254.w,
              child: Text(
                "Jelajahi dan Jadilah yang Terbaik di Setiap Karirmu !",
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium!.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(height: 16.h),
            GestureDetector(
              onTap: () {
                Nav.toRemoveUntil(context, BottomNav());
              },
              child: Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: ColorValue.secondary90Color,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/icons/arrow_right.svg",
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

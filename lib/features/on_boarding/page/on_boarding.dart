import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycareer_new/core/nav/nav.dart';
import 'package:mycareer_new/features/auth/page/login/login.dart';
import 'package:mycareer_new/features/auth/page/register/data_diri.dart';
import 'package:mycareer_new/features/home/page/home.dart';
import 'package:mycareer_new/features/on_boarding/widgets/on_boarding_content.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/theme/color_value.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Transparent status bar
        statusBarIconBrightness:
            Brightness.dark, // Dark icons (for light backgrounds)
      ),
    );
  }

  final _controller = PageController();
  final _controllerTwo = PageController();
  int _currentPage = 0;
  List colors = [Colors.white, Colors.white, Colors.white];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 410.h,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  // Tambahkan ini
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        contents[index].image,
                        clipBehavior: Clip.none,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 12.h),
            SmoothPageIndicator(
              controller: _controller,
              count: contents.length,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.orange,
                dotHeight: 8,
                dotWidth: 8,
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: ColorValue.primary90Color,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 63.5.h),

                    SizedBox(
                      height: 140.h,
                      child: PageView.builder(
                        controller: _controllerTwo,

                        itemCount: contents.length,
                        physics: NeverScrollableScrollPhysics(),
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },

                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                contents[index].title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 32.h),
                              Text(
                                contents[index].desc,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (_currentPage == 2) {
                              Nav.to(context, LoginPage());
                            } else {
                              _controllerTwo.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                              _controller.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            }
                          },
                          child: Container(
                            height: 48.h,
                            width: 48.w,
                            decoration: BoxDecoration(
                              color: ColorValue.secondary90Color,
                              shape: BoxShape.circle,
                            ),

                            child: Center(
                              child: SvgPicture.asset(
                                'assets/icons/arrow_right.svg',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 63.5.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

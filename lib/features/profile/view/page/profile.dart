import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycareer_new/core/theme/color_value.dart';
import 'package:mycareer_new/features/profile/view/page/profile_work_experience.dart';
import 'package:mycareer_new/features/skill_quest/view/widget/online_course.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light, // Icon status bar gelap
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                height: kToolbarHeight,
                color: ColorValue.primary90Color,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorValue.primary90Color,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32.r),
                    bottomRight: Radius.circular(32.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        Text(
                          "Profile",
                          style: textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        SvgPicture.asset("assets/icons/hamburger.svg"),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      height: 103.h,
                      width: 103.w,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset(
                        "assets/images/home/profile.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Dini Anjani",
                      style: textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Product Designer",
                      style: textTheme.bodySmall!.copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: ColorValue.primary20Color,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/card_single_person.svg",
                              height: 16.h,
                              width: 16.w,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              "1.622",
                              style: textTheme.titleMedium!.copyWith(
                                color: ColorValue.primary90Color,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Pengikut",
                          style: textTheme.bodySmall!.copyWith(
                            color: ColorValue.primary90Color,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/card_bookmark.svg",
                              height: 16.h,
                              width: 16.w,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              "10",
                              style: textTheme.titleMedium!.copyWith(
                                color: ColorValue.primary90Color,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Koleksi",
                          style: textTheme.bodySmall!.copyWith(
                            color: ColorValue.primary90Color,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/card_like_heart.svg",
                              height: 16.h,
                              width: 16.w,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              "22,2rb",
                              style: textTheme.titleMedium!.copyWith(
                                color: ColorValue.primary90Color,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Suka",
                          style: textTheme.bodySmall!.copyWith(
                            color: ColorValue.primary90Color,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  "Seorang UI/UX Designer yang berfokus pada menciptakan pengalaman pengguna yang intuitif dan desain antarmuka yang estetis. ",
                  style: textTheme.bodySmall,
                ),
              ),
              Material(
                elevation: 4,
                color: Colors.white,
                shadowColor: ColorValue.primary20Color,
                child: TabBar(
                  labelStyle: textTheme.labelLarge,
                  labelColor: ColorValue.secondary90Color,
                  indicatorColor: ColorValue.secondary90Color,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: ColorValue.primary20Color,
                  tabs: [Tab(text: 'Online Course'), Tab(text: 'Bootcamp')],
                ),
              ),
              Container(
                height: 120.h,
                child: TabBarView(
                  children: [
                    OnlineCourse(),
                    ProfileWorkExperience(),
                    ProfileWorkExperience(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

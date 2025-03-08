import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycareer_new/core/custom_widgets/custom_search_field_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_text_bar_widget.dart';
import 'package:mycareer_new/core/nav/nav.dart';
import 'package:mycareer_new/core/theme/color_value.dart';
import 'package:mycareer_new/features/home/widgets/home_job_trend_box_widget.dart';
import 'package:mycareer_new/features/home/widgets/home_reccomend_box_widget.dart';
import 'package:mycareer_new/features/job_pulse/page/job_pulse.dart';
import 'package:mycareer_new/features/skill_quest/view/page/skill_quest.dart';
import 'package:mycareer_new/features/skill_quest/view/widget/online_course_detail_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      backgroundColor: ColorValue.primary90Color,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 16.h + kToolbarHeight),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: _buildProfile(
                  "Dini Anjani",
                  "assets/images/home/profile.png",
                ),
              ),
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: CustomSearchFieldWidget(
                  hint: "Cari Pekerjaan Impianmu",
                  textEditingController: TextEditingController(),
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 16.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.r),
                    topRight: Radius.circular(32.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        right: 16.w,
                        top: 16.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.5.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildBar(
                                  "Career Counsel",
                                  "box_career_counsel.svg",
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Nav.to(context, SkillQuestPage());
                                    },
                                    child: _buildBar("Skill Quest", "box_skill_quest.svg")),
                                _buildBar("Scholar", "box_scholar.svg"),
                                GestureDetector(
                                  onTap: () {
                                    Nav.to(context, JobPulsePage());
                                  },
                                    child: _buildBar("Job Pulse", "box_job_pulse.svg")),
                              ],
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            "Rekomendasi Untukmu",
                            style: textTheme.bodyLarge,
                          ),
                          SizedBox(height: 8.h),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 174.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        padding: EdgeInsets.only(left: 16.w),
                        itemBuilder: (context, index) {
                          return HomeReccomendBoxWidget(
                            image: "company.png",
                            title: "Internship UI-UX",
                            company: "PT Ava Max",
                            location: "Malang, Indonesia",
                            jobType: "IT dan Teknologi",
                            fulltime: "Fulltime",
                            salary: "1.000.000",
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16.h),
                    _buildJobTrend(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfile(String name, String image) {
    TextTheme textTheme = TextTheme.of(context);
    return Row(
      children: [
        Container(
          height: 52.h,
          width: 52.w,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Image.asset(image),
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hai, $name!",
              style: textTheme.titleMedium!.copyWith(color: Colors.white),
            ),
            SizedBox(height: 8.h),
            Text(
              "Selamat datang di MyCareer!",
              style: textTheme.bodySmall!.copyWith(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBar(String name, String icon) {
    TextTheme textTheme = TextTheme.of(context);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(13.w),
          decoration: BoxDecoration(color: ColorValue.secondary20Color),
          child: Center(
            child: Column(
              children: [
                SvgPicture.asset(
                  "assets/icons/$icon",
                  height: 40.h,
                  width: 40.w,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 66.w,
          child: Text(
            name,
            style: textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildJobTrend() {
    TextTheme textTheme = TextTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Job Trend", style: textTheme.bodyLarge),
          SizedBox(height: 8.h),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorValue.secondary90Color),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text("Semua", style: textTheme.bodySmall!.copyWith(
                  color: ColorValue.secondary90Color,
                ),),
              ),
              SizedBox(width: 8.w,),
              Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorValue.secondary90Color),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text("Trending", style: textTheme.bodySmall!.copyWith(
                  color: ColorValue.secondary90Color,
                ),),
              ),
              SizedBox(width: 8.w,),

              Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorValue.secondary90Color),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  "Terbaru",
                  style: textTheme.bodySmall!.copyWith(
                    color: ColorValue.secondary90Color,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h,),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
            return HomeJobTrendBoxWidget(image: "trend.png", title: "Merebut Pasar Tenaga Kerja Global", desc: "Celaka bagi Indonesia bila angka pengangguran tinggi terjadi saat negara damai, politik relatif stabil...", date: "Jan 28, 2025", time: "11:23");
          },),
          SizedBox(height: 58.h,)
        ],
      ),
    );
  }
}

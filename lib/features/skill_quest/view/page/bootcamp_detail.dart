import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycareer_new/core/custom_widgets/custom_app_bar_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_button_widget.dart';
import 'package:mycareer_new/core/theme/color_value.dart';

class BootcampDetailPage extends StatefulWidget {
  const BootcampDetailPage({Key? key}) : super(key: key);

  @override
  State<BootcampDetailPage> createState() => _BootcampDetailPageState();
}

class _BootcampDetailPageState extends State<BootcampDetailPage> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Detail Bootcamp'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              _headContent(
                "Bootcamp 1",
                "Dadang Foundation",
                "Pemula",
                "UI/UX Designer",
                "Jakarta",
                "12 Agustus 2021",
              ),
              SizedBox(height: 16.h),
              _overviewContent(
                "Bootcamp ini dirancang untuk membekali peserta dengan keterampilan praktis dan wawasan industri sesuai dengan bidang yang diminati. Dengan kurikulum berbasis proyek, mentoring dari para ahli, serta kesempatan jaringan profesional, peserta akan mendapatkan pengalaman belajar intensif yang siap diterapkan di dunia kerja.",
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Materi", style: textTheme.bodyLarge),
                      SizedBox(height: 8.h),
                      Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorValue.primary20Color),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: _containerMateri(
                                    "Dasar",
                                    "card_idea.svg",
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                GestureDetector(
                                  onTap: () {},
                                  child: _containerMateri(
                                    "Proyek",
                                    "card_project.svg",
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: _containerMateri(
                                    "Soft Skill",
                                    "card_soft_skill.svg",
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                GestureDetector(
                                  onTap: () {},
                                  child: _containerMateri(
                                    "Mentor",
                                    "card_mentor.svg",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Benefit", style: textTheme.bodyLarge),
                      SizedBox(height: 8.h),
                      Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorValue.primary20Color),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: _containerBenefit(
                                    "Sertifikat",
                                    "card_sertifikat.svg",
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                GestureDetector(
                                  onTap: () {},
                                  child: _containerBenefit(
                                    "Koneksi",
                                    "card_koneksi.svg",
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            GestureDetector(
                              onTap: () {},
                              child: _containerBenefit(
                                "Materi",
                                "card_materi.svg",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              _informationRegistrationContent("03 Januari 2025 - 04 Januari 2029", "Rp 100.000"),
            SizedBox(height: 32.h),
              CustomButtonWidget(label: "Daftar", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headContent(
    String title,
    String company,
    String level,
    String job,
    String location,
    String date,
  ) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Colors.grey,
              ),
              child: Image.asset(
                'assets/images/skill_quest/bootcamp.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: textTheme.bodyLarge),
                SizedBox(height: 4.h),
                Text(company, style: textTheme.bodySmall),
              ],
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            _containerText(
              level,
              ColorValue.primary90Color,
              ColorValue.primary20Color,
              context,
            ),
            SizedBox(width: 8.w),
            _containerText(
              job,
              ColorValue.secondary90Color,
              ColorValue.secondary20Color,
              context,
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            border: Border.all(color: ColorValue.primary20Color),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/card_pin_point.svg",
                    height: 12.h,
                    width: 12.h,
                    color: ColorValue.primary90Color,
                  ),
                  SizedBox(width: 4.w),
                  Text(location, style: textTheme.bodySmall),
                ],
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/card_clock.svg",
                    height: 12.h,
                    width: 12.h,
                    color: ColorValue.primary90Color,
                  ),
                  SizedBox(width: 4.w),
                  Text(date, style: textTheme.bodySmall),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _overviewContent(String text) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.r),
      ),

      child: ExpansionTile(
        title: Text("Overview", style: textTheme.bodyLarge),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        collapsedIconColor: ColorValue.primary90Color,
        iconColor: ColorValue.primary90Color,
        children: [
          Divider(),
          Container(
            margin: EdgeInsets.all(16.w),
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: ColorValue.secondary20Color,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(text, style: textTheme.bodySmall),
          ),
        ],
      ),
    );
  }

  Widget _containerText(
    String text,
    Color textColor,
    Color containerColor,
    BuildContext context,
  ) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        text,
        style: textTheme.bodyMedium!.copyWith(color: textColor),
      ),
    );
  }

  Widget _containerMateri(String text, String svg) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18.5.w, vertical: 18.5.h),
          decoration: BoxDecoration(
            color: ColorValue.primary20Color,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: SvgPicture.asset(
              "assets/icons/$svg",
              height: 24.h,
              width: 24.h,
              color: ColorValue.primary90Color,
            ),
          ),
        ),
        Text(text, style: textTheme.bodySmall),
      ],
    );
  }

  Widget _containerBenefit(String text, String svg) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18.5.w, vertical: 18.5.h),
          decoration: BoxDecoration(
            color: ColorValue.secondary20Color,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: SvgPicture.asset(
              "assets/icons/$svg",
              height: 24.h,
              width: 24.h,
              color: ColorValue.secondary90Color,
            ),
          ),
        ),
        Text(text, style: textTheme.bodySmall),
      ],
    );
  }

  Widget _informationRegistrationContent(String timeRegistration, String price) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.r),
      ),

      child: ExpansionTile(
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        collapsedBackgroundColor: ColorValue.greenHueColor,
        backgroundColor: ColorValue.greenHueColor,
        title: Text("Informasi Pendaftaran", style: textTheme.bodyLarge!.copyWith(color: Colors.white)),
        collapsedIconColor: Colors.white,
        iconColor: Colors.white,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: ColorValue.greenTintColor),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/card_calendar.svg",
                  height: 24.h,
                  width: 24.h,
                  color: ColorValue.greenHueColor,
                ),
                SizedBox(width: 8.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Waktu Pendaftaran", style: textTheme.bodySmall),
                    SizedBox(height: 4.h),
                    Text(timeRegistration, style: textTheme.bodyLarge),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: ColorValue.greenTintColor),
            ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/card_money_bag.svg",
                    height: 24.h,
                    width: 24.h,
                    color: ColorValue.greenHueColor,
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Biaya Pendaftaran", style: textTheme.bodySmall),
                      SizedBox(height: 4.h),
                      Text(price, style: textTheme.bodyLarge),
                    ],
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}

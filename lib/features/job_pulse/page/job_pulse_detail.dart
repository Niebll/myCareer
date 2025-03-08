import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mycareer_new/core/custom_widgets/custom_app_bar_widget.dart';
import 'package:mycareer_new/core/theme/color_value.dart';

class JobPulseDetailPage extends StatefulWidget {
  const JobPulseDetailPage({Key? key}) : super(key: key);

  @override
  State<JobPulseDetailPage> createState() => _JobPulseDetailPageState();
}

class _JobPulseDetailPageState extends State<JobPulseDetailPage> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Detail Kerja"),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            _buildHeadContent(),
            SizedBox(height: 8.h),
            _buildBarContent(),
            SizedBox(height: 24.h),
            _buildStatusContent(),
            SizedBox(height: 24.h),
            _buildSkillNeededContent(),
            SizedBox(height: 40.h,),
            _buildWorkDesc(),
            SizedBox(height: 40.h,),

          ],
        ),
      ),
    );
  }

  Widget _buildHeadContent() {
    TextTheme textTheme = TextTheme.of(context);
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 48.h,
              width: 48.w,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Image.asset(
                "assets/images/job_pulse/company.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Internship UI - UX", style: textTheme.bodyLarge),
                SizedBox(height: 4.h),
                Text("Marlo Corp.", style: textTheme.bodySmall),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWorkDesc(){
    TextTheme textTheme = TextTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Deskripsi Pekerjaan :",style: textTheme.bodyLarge,),
        SizedBox(height: 8.h,),
        Text("Mendesain sistem atau produk yang berfokus pada karakteristik manusia atau human-centered design, dengan estetika yang disesuaikan pada user untuk menjadi lebih intuitif dan fungsional.", style: textTheme.bodySmall,),
      ],
    );
  }

  Widget _buildBenefit(){
    return Container();
  }

  Widget _buildSkillNeededContent() {
    TextTheme textTheme = TextTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Skill yang dibutuhkan", style: textTheme.bodyLarge),
        SizedBox(height: 8.h),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: ColorValue.greenTintColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/icons/check.svg",
                    width: 12.w,
                    height: 12.w,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "Continouse Learner",
                    style: textTheme.bodyLarge!.copyWith(
                      color: ColorValue.greenHueColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: ColorValue.greenTintColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/icons/check.svg",
                    width: 12.w,
                    height: 12.w,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "Mockup",
                    style: textTheme.bodyLarge!.copyWith(
                      color: ColorValue.greenHueColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: ColorValue.greenTintColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/icons/check.svg",
                    width: 12.w,
                    height: 12.w,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "Wireframing",
                    style: textTheme.bodyLarge!.copyWith(
                      color: ColorValue.greenHueColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: ColorValue.greenTintColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/icons/check.svg",
                    width: 12.w,
                    height: 12.w,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "Prototyping",
                    style: textTheme.bodyLarge!.copyWith(
                      color: ColorValue.greenHueColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBarContent() {
    TextTheme textTheme = TextTheme.of(context);
    return Container(
      padding: EdgeInsets.all(8.w),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: ColorValue.primary20Color),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _rowIconWidget("card_pin_point", "Malang, Indonesia"),
          SizedBox(height: 4.h),
          Row(
            children: [
              _rowIconWidget("card_education", "Fulltime"),
              SizedBox(width: 14.w),
              Container(
                height: 4.h,
                width: 4.w,
                decoration: BoxDecoration(
                  color: ColorValue.primary90Color,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 10.w),
              Text("Kerja di kantor", style: textTheme.bodySmall),
            ],
          ),
          SizedBox(height: 4.h),
          _rowIconWidget("card_money_bag", "1.000.000"),
        ],
      ),
    );
  }

  Widget _buildStatusContent() {
    TextTheme textTheme = TextTheme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2 - 8.w,
          decoration: BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/card_education.svg",
                    color: ColorValue.secondary90Color,
                    width: 12.w,
                    height: 12.h,
                  ),
                  SizedBox(width: 4.w),
                  Text("Pendidikan", style: textTheme.bodySmall),
                ],
              ),
              SizedBox(height: 4.h),
              Text("Minimal S1", style: textTheme.bodyLarge),
              SizedBox(height: 8.h),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/card_person.svg",
                    color: ColorValue.secondary90Color,
                    width: 12.w,
                    height: 12.h,
                  ),
                  SizedBox(width: 4.w),
                  Text("Usia", style: textTheme.bodySmall),
                ],
              ),
              SizedBox(height: 4.h),
              Text("Maksimal 35 Tahun", style: textTheme.bodyLarge),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2 - 24.w,
          decoration: BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/form_intersex.svg",
                    color: ColorValue.secondary90Color,
                    width: 12.w,
                    height: 12.h,
                  ),
                  SizedBox(width: 4.w),
                  Text("Jenis Kelamin", style: textTheme.bodySmall),
                ],
              ),
              SizedBox(height: 4.h),
              Text("Tidak ada ketentuan", style: textTheme.bodyLarge),
              SizedBox(height: 8.h),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/card_file.svg",
                    color: ColorValue.secondary90Color,
                    width: 12.w,
                    height: 12.h,
                  ),
                  SizedBox(width: 4.w),
                  Text("Pengalaman", style: textTheme.bodySmall),
                ],
              ),
              SizedBox(height: 4.h),
              Text("Minimal 1 Tahun", style: textTheme.bodyLarge),
            ],
          ),
        ),
      ],
    );
  }

  Widget _rowIconWidget(String icon, String text) {
    TextTheme textTheme = TextTheme.of(context);
    return Row(
      children: [
        SvgPicture.asset("assets/icons/$icon.svg", height: 12.h, width: 12.w),
        SizedBox(width: 4.w),
        Text(text, style: textTheme.bodySmall),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mycareer_new/core/custom_widgets/custom_app_bar_widget.dart';
import 'package:mycareer_new/core/theme/color_value.dart';

import '../../../../core/custom_widgets/custom_button_widget.dart';
import '../../../../core/custom_widgets/custom_text_bar_widget.dart';
import '../../../../core/nav/nav.dart';

class BootcampDetailPaidPage extends StatefulWidget {
  const BootcampDetailPaidPage({Key? key}) : super(key: key);

  @override
  State<BootcampDetailPaidPage> createState() => _BootcampDetailPaidPageState();
}

class _BootcampDetailPaidPageState extends State<BootcampDetailPaidPage> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Bootcamp"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              _headCardContent(),
              SizedBox(height: 16.h),
              _headStartClass(),
              SizedBox(height: 16.h,),
              _headStartRamadhanClass(),
              SizedBox(height: 16.h),
              _subjectContent(),
              SizedBox(height: 32.h),
              CustomButtonWidget(
                label: "Join Grup",
                onPressed: () {
                  Nav.to(context, BootcampDetailPaidPage());
                },
                isUnderLine: true,
              ),
              SizedBox(height: 16.h,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _headStartClass() {
    TextTheme textTheme = TextTheme.of(context);
    return Container(
      padding: EdgeInsets.all(16.w),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: ColorValue.primary20Color),
        borderRadius: BorderRadius.circular(8.r)
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Text("Pelaksanaan Kelas:", style: textTheme.bodyLarge,),
            SizedBox(height: 8.h,),
            Row(
              children: [
                SvgPicture.asset("assets/icons/card_calendar.svg", height: 12.h, width: 12.w,color: ColorValue.primary90Color,)
                ,SizedBox(width: 8.w,),
                Text("Setiap hari Senin, Rabu dan Jumat", style: textTheme.bodySmall,)
              ],
            ),
            SizedBox(height: 4.h,),
            Row(
              children: [
                SvgPicture.asset("assets/icons/card_clock.svg", height: 12.h, width: 12.w,color: ColorValue.primary90Color,)
                ,SizedBox(width: 8.w,),
                Text("19.30 - 21.30", style: textTheme.bodySmall,)
              ],
            )
          ]),
    );
  }
  Widget _headStartRamadhanClass() {
    TextTheme textTheme = TextTheme.of(context);
    return Container(
      padding: EdgeInsets.all(16.w),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: ColorValue.primary20Color),
        borderRadius: BorderRadius.circular(8.r)
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Text("Pelaksanaan Kelas:", style: textTheme.bodyLarge,),
            SizedBox(height: 8.h,),
            Row(
              children: [
                SvgPicture.asset("assets/icons/card_calendar.svg", height: 12.h, width: 12.w,color: ColorValue.primary90Color,)
                ,SizedBox(width: 8.w,),
                Text("Setiap hari Senin, Rabu dan Jumat", style: textTheme.bodySmall,)
              ],
            ),
            SizedBox(height: 4.h,),
            Row(
              children: [
                SvgPicture.asset("assets/icons/card_clock.svg", height: 12.h, width: 12.w,color: ColorValue.primary90Color,)
                ,SizedBox(width: 8.w,),
                Text("19.30 - 21.30", style: textTheme.bodySmall,)
              ],
            )
          ]),
    );
  }

  Widget _headCardContent() {
    TextTheme textTheme = TextTheme.of(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: ColorValue.primary20Color),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  "assets/images/skill_quest/bootcamp.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Skill Up Bootcamp", style: textTheme.bodyLarge),
                  SizedBox(height: 4.h),
                  Text("Lembaga Amil Zakat", style: textTheme.bodySmall),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              CustomTextBarWidget(
                text: "Pemula",
                textColor: ColorValue.primary90Color,
                containerColor: ColorValue.primary20Color,
              ),
              SizedBox(width: 8.w),
              CustomTextBarWidget(
                text: "UI/UX Designer",
                textColor: ColorValue.secondary90Color,
                containerColor: ColorValue.secondary20Color,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text("Rp. 100.000", style: textTheme.titleMedium),
        ],
      ),
    );
  }

  Widget _subjectContent() {
    TextTheme textTheme = TextTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Materi Bootcamp"),
        SizedBox(height: 8.h),
        _informationRegistrationWidget("Introduction Figma"),
        SizedBox(height: 8.h),
        _informationRegistrationWidget("Pembuatan WireFrame"),
        SizedBox(height: 8.h),
        _informationRegistrationWidget("Introduction Figma"),
      ],
    );
  }

  Widget _informationRegistrationWidget(String title) {
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        collapsedBackgroundColor: ColorValue.primary90Color,
        backgroundColor: ColorValue.primary90Color,
        title: Text(
          title,
          style: textTheme.bodyLarge!.copyWith(color: Colors.white),
        ),
        collapsedIconColor: Colors.white,
        iconColor: Colors.white,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: ColorValue.primary20Color),
            ),
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: ColorValue.primary20Color,
                border: Border.all(color: ColorValue.primary90Color),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1. Mengenal figma secara umum",
                    style: textTheme.bodySmall,
                  ),
                  Text("2. Tools figma", style: textTheme.bodySmall),
                  Text(
                    "3. Contoh penggunaan figma",
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

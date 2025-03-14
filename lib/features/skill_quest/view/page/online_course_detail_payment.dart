import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mycareer_new/core/custom_widgets/custom_app_bar_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_button_widget.dart';
import 'package:mycareer_new/core/nav/nav.dart';
import 'package:mycareer_new/features/skill_quest/view/page/online_course_detail.dart';

import '../../../../core/custom_widgets/custom_text_bar_widget.dart';
import '../../../../core/theme/color_value.dart';

class OnlineCourseDetailPaymentPage extends StatelessWidget {
  const OnlineCourseDetailPaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Pembayaran"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal:  16.w),
        child: Column(
          children: [
            SizedBox(height: 16.h,),
        _headCardContent(context),
            SizedBox(height: 8.h,),
            _benefitCard(context),
            Spacer(),
            CustomButtonWidget(label: "Bayar", onPressed: () {
              Nav.to(context, OnlineCourseDetailPage(isPaid: true,));
            },),
            SizedBox(height: 16.h,)
          ],
        ),
      ),
    );
  }
  Widget _headCardContent(BuildContext context) {
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
                  "assets/images/skill_quest/course.png",
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
          Text("Rp. 100.000", style: textTheme.titleMedium),
        ],
      ),
    );
  }


  Widget _benefitCard(BuildContext context){
    TextTheme textTheme = TextTheme.of(context);
    return               Container(
      padding: EdgeInsets.all(16.w),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: ColorValue.primary20Color)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Detail: ", style: textTheme.bodyLarge,),
          SizedBox(height: 8.h,),
          Row(
            children: [
              SvgPicture.asset("assets/icons/check.svg", height: 12.h, width: 12.w,),
              SizedBox(width: 8.w,),
              Text("Akses kapanpun yang kamu mau"),
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          Row(
            children: [
              SvgPicture.asset("assets/icons/check.svg", height: 12.h, width: 12.w,),
              SizedBox(width: 8.w,),
              Text("Akses seluruh materi"),
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          Row(
            children: [
              SvgPicture.asset("assets/icons/check.svg", height: 12.h, width: 12.w,),
              SizedBox(width: 8.w,),
              Text("Kuis serta kunci jawabannya"),
            ],
          ),
        ],
      ),
    );
  }
}

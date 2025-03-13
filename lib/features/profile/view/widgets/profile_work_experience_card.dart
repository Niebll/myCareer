import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycareer_new/core/custom_widgets/custom_text_bar_widget.dart';
import 'package:mycareer_new/core/theme/color_value.dart';

class ProfileWorkExperienceCard extends StatelessWidget {
  final String dateStart, dateEnd, company, job;

  const ProfileWorkExperienceCard({
    super.key,
    required this.dateStart,
    required this.dateEnd,
    required this.company,
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(bottom: 16.h, left: 16.w, right: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: ColorValue.primary20Color),
      ),
      child: Row(
        children: [
          CustomTextBarWidget(
            text: dateStart,
            textColor: ColorValue.primary90Color,
            containerColor: ColorValue.primary20Color,
          ),
          SizedBox(width: 8.w),
          Container(
            width: 12.w,
            height: 3.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: ColorValue.primary90Color,
            ),
          ),
          SizedBox(width: 8.w),
          CustomTextBarWidget(
            text: dateEnd,
            textColor: ColorValue.primary90Color,
            containerColor: ColorValue.primary20Color,
          ),
          SizedBox(width: 16.w),
          Column(
            children: [
              Text(company, style: textTheme.bodyLarge),
              Text(job, style: textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/custom_widgets/custom_text_bar_widget.dart';
import '../../../core/theme/color_value.dart';

class ProfileEducationExperienceCard extends StatelessWidget {
  final String dateStart, dateEnd, education, position;

  const ProfileEducationExperienceCard({
    Key? key,
    required this.dateStart,
    required this.dateEnd, required this.education, required this.position,
  }) : super(key: key);

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
            textColor: ColorValue.secondary90Color,
            containerColor: ColorValue.secondary20Color,
          ),
          SizedBox(width: 8.w),
          Container(
            width: 12.w,
            height: 3.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: ColorValue.secondary90Color,
            ),
          ),
          SizedBox(width: 8.w),
          CustomTextBarWidget(
            text: dateEnd,
            textColor: ColorValue.secondary90Color,
            containerColor: ColorValue.secondary20Color,
          ),
          SizedBox(width: 16.w),
          Column(
            children: [
              Text(education, style: textTheme.bodyLarge),
              Text(position, style: textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}

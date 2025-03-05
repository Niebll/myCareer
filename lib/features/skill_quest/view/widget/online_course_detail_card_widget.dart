import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/color_value.dart';

class OnlineCourseDetailCardWidget extends StatelessWidget {
  final String title, desc;

  const OnlineCourseDetailCardWidget({
    super.key,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(8.w),
      margin: EdgeInsets.only(right: 8.w),
      height: 204.h,
      width: 188.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: ColorValue.primary20Color),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: textTheme.bodyMedium),
          SizedBox(height: 8.h),
          Text(
            desc,
            style: textTheme.bodySmall,
            maxLines: 9,
            overflow: TextOverflow.ellipsis,
          ),

        ],
      ),
    );
  }
}

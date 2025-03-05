import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycareer_new/core/custom_widgets/custom_text_bar_widget.dart';

import '../../../../core/theme/color_value.dart';

class OnlineCourseCard extends StatelessWidget {
  final String image, jobType, job, rating, topics;
  const OnlineCourseCard({Key? key, required this.image, required this.jobType, required this.job, required this.rating, required this.topics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
        border: Border.all(color: ColorValue.primary20Color),
        borderRadius: BorderRadius.circular(8.r)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 147.h,
              width: 148.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Image.asset(image, fit: BoxFit.cover,)),
          SizedBox(height: 8.h,),
          CustomTextBarWidget(text: jobType, textColor: ColorValue.primary90Color, containerColor: ColorValue.primary20Color),
          SizedBox(height: 8.h,),
          Text(job, style: textTheme.bodyLarge,),
          SizedBox(height: 4.h,),
          Row(
            children: [
              SvgPicture.asset("assets/icons/card_star.svg",
              height: 12.h,
                width: 12.w,
              ),
              SizedBox(
                width: 4.w,
              ),
              Text("$rating/5", style: textTheme.bodySmall,)
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          Row(
            children: [
              SvgPicture.asset("assets/icons/card_file.svg",
                height: 12.h,
                width: 12.w,
                color: ColorValue.secondary90Color,
              ),
              SizedBox(
                width: 4.w,
              ),
              Text("$rating Topik", style: textTheme.bodySmall,)
            ],
          )

        ],
      ),
    );
  }
}

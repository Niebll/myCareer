import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mycareer_new/core/custom_widgets/custom_text_bar_widget.dart';
import 'package:mycareer_new/core/theme/color_value.dart';

class OnlineCourseMaterialCard extends StatelessWidget {
  final String title, type;

  const OnlineCourseMaterialCard({
    super.key,
    required this.title,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(bottom: 8.h),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: ColorValue.primary20Color),
        borderRadius: BorderRadius.circular(8.r),
      ),child: Row(
      children: [
        Container(
          height: 48.h,
          width: 48.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),
            color: ColorValue.primary20Color,
          ),
          child: Center(
            child: SvgPicture.asset(
              "assets/icons/skill_quest_book.svg",
              width: 24.w,
              height: 28.110000610351562.h,
            ),
          ),
        ),
        SizedBox(width: 8.w,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: textTheme.bodyLarge,),
            SizedBox(height: 4.h,),
            CustomTextBarWidget(text: "Video", textColor: ColorValue.secondary90Color, containerColor: ColorValue.secondary20Color)
          ],
        ),
        Spacer(),
        SvgPicture.asset("assets/icons/legless_arrow_right.svg", height: 24.h,)
      ],
    ),
    );
  }
}

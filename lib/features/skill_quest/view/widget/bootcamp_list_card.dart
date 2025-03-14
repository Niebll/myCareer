import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycareer_new/core/custom_widgets/custom_text_bar_widget.dart';
import 'package:mycareer_new/core/theme/color_value.dart';

class BootcampListCard extends StatelessWidget {
  final String img, name, level, job;

  const BootcampListCard({
    super.key,
    required this.img,
    required this.name,
    required this.level,
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: ColorValue.primary20Color),
      ),
      child: Row(
        children: [
          Container(
            height: 52.h,
            width: 52.w,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
            child: Image.asset(img),
          ),
          SizedBox(width: 16.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: textTheme.bodyLarge,),
              SizedBox(height: 8.h,),
              Row(
                children: [
                  CustomTextBarWidget(text: level, textColor: ColorValue.greenHueColor, containerColor: ColorValue.greenTintColor),
                  SizedBox(width: 8.w,),
                  CustomTextBarWidget(text: job, textColor: ColorValue.secondary90Color, containerColor: ColorValue.secondary20Color)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

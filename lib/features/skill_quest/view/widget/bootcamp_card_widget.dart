import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycareer_new/core/theme/color_value.dart';

class BootcampCardWidget extends StatelessWidget {
  final String title, image, date, paid, online, job, level;

  const BootcampCardWidget({
    Key? key,
    required this.title,
    required this.image,
    required this.date,
    required this.paid,
    required this.online,
    required this.job,
    required this.level,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.all(16.w),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: ColorValue.primary20Color),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 126.40.h,
            width: 116.w,
            decoration: BoxDecoration(
              border: Border.all(color: ColorValue.primary20Color),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Image.asset(image, fit: BoxFit.cover),
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: textTheme.bodyLarge),
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/form_calendar.svg",
                    height: 12.h,
                    width: 12.h,
                    color: ColorValue.primary90Color,
                  ),
                  SizedBox(width: 4.w),
                  Text(date, style: textTheme.bodySmall),
                ],
              ),
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/card_money_bag.svg",
                    height: 12.h,
                    width: 12.h,
                    color: ColorValue.primary90Color,
                  ),
                  SizedBox(width: 4.w),
                  Text(paid, style: textTheme.bodyLarge),
                ],
              ),
              SizedBox(height: 8.h),
              _containerText(online, ColorValue.primary90Color, ColorValue.primary20Color, context),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  _containerText(job, ColorValue.secondary90Color, ColorValue.secondary20Color, context),
                  SizedBox(width: 8.w),
                  _containerText(level, ColorValue.greenHueColor, ColorValue.greenTintColor, context),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
  Widget _containerText(String text, Color textColor, Color containerColor, BuildContext context){
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
}

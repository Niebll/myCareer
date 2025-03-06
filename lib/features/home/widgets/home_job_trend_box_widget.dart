import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycareer_new/core/theme/color_value.dart';

class HomeJobTrendBoxWidget extends StatelessWidget {
  final String image, title, desc, date, time;

  const HomeJobTrendBoxWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.desc,
    required this.date,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Container(
      padding: EdgeInsets.all(8.w),
      margin: EdgeInsets.only(bottom: 16.h),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: ColorValue.primary20Color),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 112.h,
                width: 73.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  "assets/images/home/$image",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    width: 230.w,
                    child: Text(
                      desc,
                      style: textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/form_calendar.svg",
                        height: 12.h,
                        width: 12.w,
                        color: ColorValue.netralColor,
                      ),
                      SizedBox(width: 4.w,),
                      Text(date, style: textTheme.bodySmall,),
                      SizedBox(width: 16.w,),
                      SvgPicture.asset(
                        "assets/icons/card_light_clock.svg",
                        height: 12.h,
                        width: 12.w,
                        color: ColorValue.netralColor,
                      ),
                      SizedBox(width: 4.w,),
                      Text(time, style: textTheme.bodySmall,),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

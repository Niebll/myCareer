import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycareer_new/core/custom_widgets/custom_text_bar_widget.dart';
import 'package:mycareer_new/core/theme/color_value.dart';

class ScholarCardWidget extends StatelessWidget {
  const ScholarCardWidget({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: ColorValue.primary20Color),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              "assets/images/scholar/scholar.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Beasiswa Cemerlang", style: textTheme.bodyLarge),
              SizedBox(height: 4.h),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/card_start_date.svg"),
                  SizedBox(width: 4.w),
                  Text("Mulai : 03 Maret 2025", style: textTheme.bodySmall),
                ],
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/card_end_date.svg"),
                  SizedBox(width: 4.w),
                  Text("Mulai : 03 Febuari 2028", style: textTheme.bodySmall),
                ],
              ),
              SizedBox(height: 8.h,),
              Row(
                children: [
                  CustomTextBarWidget(text: "S1", textColor: ColorValue.primary90Color, containerColor: ColorValue.primary20Color),
                  SizedBox(width: 8.w,),
                  CustomTextBarWidget(text: "D4", textColor: ColorValue.primary90Color, containerColor: ColorValue.primary20Color),
                  SizedBox(width: 8.w,),
                  CustomTextBarWidget(text: "Luar Negeri", textColor: ColorValue.greenHueColor, containerColor: ColorValue.greenTintColor),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

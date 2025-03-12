import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/custom_widgets/custom_text_bar_widget.dart';
import '../../../../core/theme/color_value.dart';

class HomeReccomendBoxWidget extends StatelessWidget {
  final String image, title, company, location, jobType, fulltime, salary;
  const HomeReccomendBoxWidget({Key? key, required this.image, required this.title, required this.company, required this.location, required this.jobType, required this.fulltime, required this.salary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Container(
      height: 174.h,

      margin: EdgeInsets.only(right: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: ColorValue.primary20Color,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 48.h,
                width: 48.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    8.r,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  "assets/images/home/$image",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.bodyLarge,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    company,
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/card_pin_point.svg",
                color: ColorValue.primary90Color,
                height: 12.h,
                width: 12.w,
              ),
              SizedBox(width: 4.w),
              Text(
                location,
                style: textTheme.bodySmall,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              CustomTextBarWidget(
                text: jobType,
                textColor: ColorValue.greenHueColor,
                containerColor: ColorValue.greenTintColor,
              ),
              SizedBox(width: 8.w),
              CustomTextBarWidget(
                text: fulltime,
                textColor: ColorValue.primary90Color,
                containerColor: ColorValue.primary20Color,
              ),
            ],
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: 180.w,
            child: Row(
              children: [
                Spacer(),
                Text(
                  "Rp $salary",
                  style: textTheme.bodyMedium!.copyWith(
                    color: ColorValue.primary90Color,
                  ),
                ),
                Text("/bulan"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

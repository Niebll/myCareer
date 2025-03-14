import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycareer_new/core/custom_widgets/custom_text_bar_widget.dart';
import 'package:mycareer_new/core/theme/color_value.dart';

class CareerCounselCard extends StatelessWidget {
  final String image, name, jobType, workExperience, price;
  const CareerCounselCard({super.key, required this.image, required this.name, required this.jobType, required this.workExperience, required this.price});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: ColorValue.primary20Color),
      ),
      child: Row(
        children: [
          Container(
            height: 118.h,
            width: 95.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(image, fit: BoxFit.cover,),
          ),
          SizedBox(width: 16.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style:  textTheme.bodyLarge,),
              SizedBox(height: 4.h,),
              Text(jobType, style: textTheme.bodySmall,),
              SizedBox(height: 4.h,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: ColorValue.bgNavColor,
                  borderRadius: BorderRadius.circular(8.r)
                ),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/app_bar_work_bag.svg", width: 12.w, height: 12.h),
                    SizedBox(width: 8.w,),
                    Text(workExperience, style: textTheme.bodyMedium,)
                  ],
                ),
              ),
              SizedBox(height: 8.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Rp $price", style: textTheme.bodyLarge,),
                  SizedBox(width: 88.w,),
                  CustomTextBarWidget(text: "Chat", textColor: ColorValue.primary90Color, containerColor: ColorValue.primary20Color)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

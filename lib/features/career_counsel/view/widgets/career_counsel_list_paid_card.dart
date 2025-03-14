import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycareer_new/core/nav/nav.dart';
import 'package:mycareer_new/core/theme/color_value.dart';
import 'package:mycareer_new/features/career_counsel/view/page/career_counsel.dart';

class CareerCounselListPaidCard extends StatelessWidget {
  final String img, name, jobType, workExperience, paymentStatus;

  const CareerCounselListPaidCard({
    super.key,
    required this.img,
    required this.name,
    required this.jobType,
    required this.workExperience,
    required this.paymentStatus,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Container(
      padding: EdgeInsets.all(8.w),
      margin: EdgeInsets.only(bottom: 8.h),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: ColorValue.primary20Color),
      ),
      child: Row(
        children: [
          Container(
            height: 108.h,
            width: 108.w,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
            child: Image.asset(img, fit: BoxFit.cover),
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: textTheme.bodyLarge),
              SizedBox(height: 4.h),
              Text("Bisnis", style: textTheme.bodySmall),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: ColorValue.bgNavColor,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/app_bar_work_bag.svg",
                          height: 12.h,
                          width: 12.w,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          "$workExperience tahun",
                          style: textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: ColorValue.greenTintColor,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      children: [
                        Text(
                          paymentStatus,
                          style: textTheme.bodyMedium!.copyWith(
                            color: ColorValue.greenHueColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h,),
              GestureDetector(
                onTap: () {
                  Nav.to(context, CareerCounselPage());
                },
                child: Container(
                  width: 149.w,
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  decoration: BoxDecoration(
                    color: ColorValue.primary90Color,
                    borderRadius: BorderRadius.circular(4.r)
                  ),
                  child: Center(
                    child: Text("Konsultasi Kembali", style: textTheme.bodyMedium!.copyWith(
                      color: Colors.white
                    ),),
                  ),
                ),
              )

            ],
          ),
        ],
      ),
    );
  }
}

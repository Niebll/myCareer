import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycareer_new/core/theme/color_value.dart';

class JobPulseCard extends StatelessWidget {
  final String image, title, company, location, minimumEdu, salary;

  const JobPulseCard({
    super.key,
    required this.image,
    required this.title,
    required this.company,
    required this.location,
    required this.minimumEdu,
    required this.salary,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: ColorValue.primary20Color),
        borderRadius: BorderRadius.circular(8.r),
      ),
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.all(16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Container(
            width: 103.w,
            height: 103.h,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
            child: Image.asset(
              "assets/images/job_pulse/$image.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: textTheme.bodyLarge),
              SizedBox(height: 4.h),
              Text(company, style: textTheme.bodySmall),
              SizedBox(height: 8.h,),
              _rowIconWidget("card_pin_point", location, context),
              SizedBox(height: 4.h,),
              _rowIconWidget("card_education", minimumEdu, context),
              SizedBox(height: 4.h,),
              _rowIconWidget("card_money_bag", salary, context),

            ],
          ),
          Spacer(),
          SvgPicture.asset("assets/icons/legless_arrow_right.svg")
        ],
      ),
    );
  }
  Widget _rowIconWidget(String icon, String text, BuildContext context){
    TextTheme textTheme = TextTheme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/icons/$icon.svg", height: 12.h, width: 12.w,),
        SizedBox(width: 4.w,),
        Text(text,style: textTheme.bodySmall,)
      ],
    );
  }
}

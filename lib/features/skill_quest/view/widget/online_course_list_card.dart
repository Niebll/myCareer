import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycareer_new/core/custom_widgets/custom_text_bar_widget.dart';
import 'package:mycareer_new/core/theme/color_value.dart';

class OnlineCourseListCard extends StatelessWidget {
  final String img, name, manyTopik;
  const OnlineCourseListCard({Key? key, required this.img, required this.name, required this.manyTopik}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme =TextTheme.of(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        border: Border.all(color: ColorValue.primary20Color),
        borderRadius: BorderRadius.circular(8.r)
      ),
      child: Row(
        children: [
          Container(
            height: 60.h,
            width: 60.w,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Image.asset(img, fit: BoxFit.cover,),
          ),
          SizedBox(width: 16.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: textTheme.bodyLarge,),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/card_file.svg", height: 12.h, width: 12.w, color: ColorValue.secondary90Color,),
                  SizedBox(width: 4.w,),
                  Text("$manyTopik Topik", style: textTheme.bodySmall,)
                ],
              )
            ],
          ),
          Spacer(),
          CustomTextBarWidget(text: "Mulai", textColor: ColorValue.primary90Color, containerColor: ColorValue.primary20Color)
        ],
      ),
    );
  }
}

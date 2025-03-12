import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycareer_new/core/theme/color_value.dart';

class CareerHubPostCard extends StatelessWidget {
  final String img, userName, userUserName, postText, postHour, postComments, postLikes ;
  const CareerHubPostCard({super.key, required this.img, required this.userName, required this.userUserName, required this.postText, required this.postHour, required this.postComments, required this.postLikes});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: ColorValue.primary20Color)

      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 32.h,
                width: 32.w,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(img,fit: BoxFit.cover,),
              ),
              SizedBox(width: 8.w,),
              Text(userName, style: textTheme.bodyLarge,),
              SizedBox(width: 4.w,),
              Text(userUserName, style: textTheme.bodySmall,),
              Spacer(),
              Text(postHour, style: textTheme.bodySmall,)
            ],
          ),
          SizedBox(height: 8.h,),
          Text(postText, style: textTheme.bodyMedium,),
          SizedBox(height: 12.h,),
          Row(
            children: [
              SvgPicture.asset("assets/icons/card_post_comment.svg", height: 16.h, width: 16.w,),
              SizedBox(width: 4.w,),
              Text(postComments, style: textTheme.bodySmall,),
              SizedBox(width: 16.w,),
              SvgPicture.asset("assets/icons/card_post_love.svg", height: 16.h, width: 16.w,),
              SizedBox(width: 4.w,),
              Text(postLikes, style: textTheme.bodySmall,)
            ],
          )
        ],
      ),
    );
  }
}

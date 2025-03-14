import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycareer_new/core/theme/color_value.dart';

class CareerCounselChatListWidget extends StatelessWidget {
  final String img, name, lastChat, lastTimeChat, manyUnreadChat;
  const CareerCounselChatListWidget({Key? key, required this.img, required this.name, required this.lastChat, required this.lastTimeChat, required this.manyUnreadChat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: ColorValue.primary20Color),
        )
      ),
      child: Row(
        children: [
          Container(
            height: 48.h,
            width: 48.w,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle
            ),
            child: Image.asset("assets/images/career_counsel/profile_company.jpg", fit: BoxFit.cover,),
          ),
          SizedBox(width: 16.w,),
          Column(
              children: [
                Text(name, style: textTheme.bodyLarge,),
                SizedBox(height: 4.h,),
                Text(lastChat, style: textTheme.bodySmall,)
              ],
          ),
          Spacer(),
          Column(
            children: [
              Text("$lastTimeChat lalu", style: textTheme.bodySmall,),
              SizedBox(height: 4.h,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorValue.primary90Color
                ),
                child: Text(manyUnreadChat, style: textTheme.bodyMedium!.copyWith(
                  color: Colors.white
                ),),
              ),

            ],
          )
        ],
      ),
    );
  }
}

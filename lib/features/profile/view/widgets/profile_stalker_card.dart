import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycareer_new/core/theme/color_value.dart';

class ProfileStalkerCard extends StatelessWidget {
  final String img, userName, userCompany, userPosition, userTimeVisit;

  const ProfileStalkerCard({
    super.key,
    required this.img,
    required this.userName,
    required this.userCompany,
    required this.userPosition,
    required this.userTimeVisit,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 14.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
    decoration: BoxDecoration(
      border: Border.all(color: ColorValue.primary20Color,),
      borderRadius: BorderRadius.circular(8.r)
    ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 28.h,
                width: 28.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset("assets/images/profile/watcher.png"),
              ),
              SizedBox(width: 8.w,),
              Text(userName, style: textTheme.bodyLarge,),
              Spacer(),
              Text(userTimeVisit, style: textTheme.bodySmall,),
            ],
          ),
          SizedBox(height: 8.h,),
          Text(userCompany, style: textTheme.bodyLarge,),
          Text(userPosition, style: textTheme.bodySmall,)
        ],
      ),
    );
  }
}

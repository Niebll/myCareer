import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePortoCard extends StatelessWidget {
  const ProfilePortoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Column(
      children: [
        Container(
          width: 103.67.w,
          height: 121.25.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(
            "assets/images/profile/porto.png",
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 5.h,),
        Row(
          children: [
            SizedBox(width: 6.w,),
            SvgPicture.asset("assets/icons/card_like_love_unfill.svg"),
            Text("100", style: textTheme.bodySmall,),
          ],
        )
      ],
    );
  }
}

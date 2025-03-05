import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/color_value.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  bool isTabbar;
   CustomAppBarWidget({super.key, required this.title, this.isTabbar = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title), // Pastikan title adalah Widget
      elevation: 0,

      surfaceTintColor: Colors.white,
      leading: Padding(
        padding: EdgeInsets.only(left: 0.w),
        child: IconButton(
          icon: SvgPicture.asset("assets/icons/arrow_left.svg", color: ColorValue.netralColor,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.h),
        child: Container(
          color: ColorValue.primary20Color,
          height: 1.h,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 1.h);
}

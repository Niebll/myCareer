import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/color_value.dart';

class CustomTipsCardWidget extends StatelessWidget {
  final String text;

  const CustomTipsCardWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: ColorValue.secondary20Color,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Center(
        child: Text(
          text,
          style: textTheme.bodyMedium,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextBarWidget extends StatelessWidget {
  final String text;
  final Color textColor, containerColor;
  const CustomTextBarWidget({super.key, required this.text, required this.textColor, required this.containerColor});

  @override
  Widget build(BuildContext context) {
      TextTheme textTheme = Theme.of(context).textTheme;
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          text,
          style: textTheme.bodyMedium!.copyWith(color: textColor),
        ),
      );

  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycareer_new/core/theme/color_value.dart';

class BenefitChip extends StatelessWidget {
  final String label;
  const BenefitChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: ColorValue.secondary20Color,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        label,
        style: textTheme.bodyMedium!.copyWith(
          color: ColorValue.secondary90Color
        )
      ),
    );
  }
}

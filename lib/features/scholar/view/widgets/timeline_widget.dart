import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycareer_new/core/theme/color_value.dart';
import 'package:mycareer_new/features/scholar/view/widgets/timeline_step.dart';

class TimelineWidget extends StatelessWidget {
  final List<TimelineStep> steps = [
    TimelineStep(
      "Perpanjang",
      "03 Maret - 05 Maret 2025",
    ),
    TimelineStep(
      "Seleksi",
      "06 Maret - 07 Maret 2025",
    ),
    TimelineStep(
      "Penugasan",
      "13 Maret - 14 Maret 2025",
    ),
  ];

  TimelineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: steps.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return TimelineTile(
          lastActive: 2,
          index: index,
          step: steps[index],
          isFirst: index == 0,
          isLast: index == steps.length - 1,
        );
      },
    );
  }
}

class TimelineTile extends StatelessWidget {
  final int index;
  final TimelineStep step;
  final bool isFirst;
  final bool isLast;
  final int lastActive;

  const TimelineTile({
    super.key,
    required this.step,
    required this.lastActive,
    this.isFirst = false,
    this.isLast = false, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 10.w,
              height: 10.w,
              padding: EdgeInsets.all(1.2.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: ColorValue.primary90Color),
              ),
              child:
              // logika jika index bukan angka kurang dari lastActive
              index <= lastActive - 1
                      ? Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorValue.primary90Color,
                        ),
                      )
                      : SizedBox(),
            ),
            SizedBox(height: 4.h),
            if (!isLast)
              Container(
                width: 4.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: ColorValue.primary90Color,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            SizedBox(height: 4.h),
          ],
        ),
        SizedBox(width: 8),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: 4.h),
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color:               index <= lastActive - 1
                  ? ColorValue.primary90Color : ColorValue.primary20Color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step.title,
                  style: textTheme.bodyLarge!.copyWith(
                    color:               index <= lastActive - 1
                        ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  step.date,
                  style: textTheme.bodySmall!.copyWith(
                    color:               index <= lastActive - 1
                        ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

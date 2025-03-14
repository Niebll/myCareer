import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mycareer_new/core/nav/nav.dart';
import 'package:mycareer_new/features/skill_quest/view/page/online_course_detail.dart';
import 'package:mycareer_new/features/skill_quest/view/page/online_course_list.dart';
import 'package:mycareer_new/features/skill_quest/view/widget/online_course_card.dart';

import '../../../../core/custom_widgets/custom_search_field_widget.dart';
import '../../../../core/theme/color_value.dart';

class OnlineCourse extends StatefulWidget {
  const OnlineCourse({super.key});

  @override
  State<OnlineCourse> createState() => _OnlineCourseState();
}

class _OnlineCourseState extends State<OnlineCourse> {
  TextEditingController searchEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            GestureDetector(
              onTap: () {
                Nav.to(context, OnlineCourseListPage());
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: 16.w,
                  top: 16.w,
                  bottom: 16.w,
                  right: 7.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: ColorValue.primary20Color),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 48.h,
                      width: 48.w,
                      decoration: BoxDecoration(
                        color: ColorValue.primary20Color,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/icons/skill_quest_book.svg",
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                    ),
                    SizedBox(width: 16.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Daftar Course", style: textTheme.bodyLarge),
                        SizedBox(height: 4.h),
                        Text(
                          "Lihat course mu yang telah tersedia",
                          style: textTheme.bodySmall,
                        ),
                      ],
                    ),
                    Spacer(),
                    SvgPicture.asset(
                      "assets/icons/legless_arrow_right.svg",
                      height: 24.h,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            CustomSearchFieldWidget(
              hint: "Cari Materi...",
              textEditingController: searchEditingController,
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorValue.primary90Color),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Filter",
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall!.copyWith(color: Colors.black),
                      ),
                      SizedBox(width: 8.w),
                      SvgPicture.asset(
                        "assets/icons/card_filter.svg",
                        height: 16.h,
                        width: 16.w,
                        color: ColorValue.primary90Color,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Text("Daftar Course", style: textTheme.bodyLarge),
            SizedBox(height: 8.h),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 8.h,
                mainAxisExtent: 267.h,
              ),
              itemCount: 8,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Nav.to(context, OnlineCourseDetailPage()),
                  child: OnlineCourseCard(
                    image: "assets/images/skill_quest/course.png",
                    jobType: "IT dan Teknologi",
                    job: "Front End",
                    rating: "4,9",
                    topics: "10",
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycareer_new/core/custom_widgets/custom_search_field_widget.dart';
import 'package:mycareer_new/core/nav/nav.dart';
import 'package:mycareer_new/core/theme/color_value.dart';
import 'package:mycareer_new/features/skill_quest/view/page/bootcamp_detail.dart';
import 'package:mycareer_new/features/skill_quest/view/page/bootcamp_list.dart';
import 'package:mycareer_new/features/skill_quest/view/widget/bootcamp_card_widget.dart';

class Bootcamp extends StatefulWidget {
  const Bootcamp({Key? key}) : super(key: key);

  @override
  State<Bootcamp> createState() => _BootcampState();
}

class _BootcampState extends State<Bootcamp> {
  TextEditingController searchEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 28.h),
            GestureDetector(
              onTap: () {
                Nav.to(context, BootcampListPage());
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
                        color: ColorValue.greenTintColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/icons/card_medal.svg",
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
              hint: "Cari Bootcamp...",
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
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Nav.to(context, BootcampDetailPage());
                  },
                  child: BootcampCardWidget(
                    title: "Bootcamp 1",
                    image: "assets/images/skill_quest/bootcamp.png",
                    date: "12 Maret 2024",
                    paid: "Berbayar",
                    online: "Online",
                    job: "UI/UX",
                    level: "Pemula",
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

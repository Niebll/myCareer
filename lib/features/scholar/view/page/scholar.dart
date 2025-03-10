import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mycareer_new/core/custom_widgets/custom_app_bar_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_search_field_widget.dart';
import 'package:mycareer_new/features/scholar/view/widgets/scholar_card_widget.dart';

import '../../../../core/theme/color_value.dart';

class ScholarPage extends StatefulWidget {
  const ScholarPage({Key? key}) : super(key: key);

  @override
  State<ScholarPage> createState() => _ScholarPageState();
}

class _ScholarPageState extends State<ScholarPage> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Scholar"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            CustomSearchFieldWidget(
              hint: "Cari Beasiswa...",
              textEditingController: TextEditingController(),
            ),
            SizedBox(height: 16.h),
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
            SizedBox(height: 16.h,),

            ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
              return ScholarCardWidget();
            },)
          ],
        ),
      ),
    );
  }
}

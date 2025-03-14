import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mycareer_new/core/custom_widgets/custom_app_bar_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_search_field_widget.dart';
import 'package:mycareer_new/core/nav/nav.dart';
import 'package:mycareer_new/features/job_pulse/widgets/job_pulse_card.dart';

import '../../../core/theme/color_value.dart';
import 'job_pulse_detail.dart';

class JobPulsePage extends StatefulWidget {
  final bool isFocus;
  const JobPulsePage({super.key, this.isFocus = false});

  @override
  State<JobPulsePage> createState() => _JobPulsePageState();
}

class _JobPulsePageState extends State<JobPulsePage> {

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.isFocus) {
      Future.delayed(Duration.zero, () {
        FocusScope.of(context).requestFocus(_searchFocusNode);
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Job Pulse"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 24.h),
              CustomSearchFieldWidget(
                hint: "Cari Pekerjaan atau Perusahaan",
                textEditingController: _searchController,
                focusNode: _searchFocusNode,
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
                itemCount: 3,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Nav.to(context, JobPulseDetailPage());
                    },
                    child: JobPulseCard(image: "company", title: "Internship UI-UX", company: "PT Ava Max", location: "PT Ava Max", minimumEdu: "Malang, Indonesia", salary: "Rp. 1.000.000"));
              },)
            ],
          ),
        ),
      ),
    );
  }
}

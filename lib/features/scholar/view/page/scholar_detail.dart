import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mycareer_new/core/custom_widgets/custom_app_bar_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_button_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_text_bar_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_tips_card_widget.dart';
import 'package:mycareer_new/core/theme/color_value.dart';
import 'package:mycareer_new/features/scholar/view/widgets/timeline_widget.dart';

import '../widgets/timeline_step.dart';

class ScholarDetailPage extends StatefulWidget {
  const ScholarDetailPage({super.key});

  @override
  State<ScholarDetailPage> createState() => _ScholarDetailPageState();
}

class _ScholarDetailPageState extends State<ScholarDetailPage> {
  List<String> listMinimum = ["S1", "D4"];
  List<String> listTermsAndCons = [
    "Warga Negara Indonesia (WNI) berusia 18-35 tahun",
    "Tidak sedang menerima beasiswa lain (kecuali ada ketentuan berbeda)",
    "Memiliki motivasi yang kuat untuk belajar dan berkembang",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Detail Beasiswa"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 32.h),
              _buildHeadContent(),
              SizedBox(height: 24.h),
              _buildDescScholar(),
              SizedBox(height: 16.h),
              _buildStatusContent(),
              SizedBox(height: 16.h),
              _buildTermsAndCons(),
              SizedBox(height: 16.h),
              _buildTimelineContent(),
              SizedBox(height: 16.h),
              CustomTipsCardWidget(
                text:
                    "Tips : Jika kamu klik “Daftar” kamu akan langsung dialihkan menuju link perusahaan terkait untuk melanjutkan proses lamar kerja",
              ),
              SizedBox(height: 32.h),
              CustomButtonWidget(label: "Daftar", onPressed: () {}, isUnderLine: true,),
              SizedBox(height: 16.h,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeadContent() {
    TextTheme textTheme = TextTheme.of(context);
    return Row(
      children: [
        Container(
          height: 48.h,
          width: 48.w,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
          child: Image.asset(
            "assets/images/scholar/scholar.png",
            height: 48.h,
            width: 48.w,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("SmartFuture Scholarship", style: textTheme.bodyLarge),
            SizedBox(height: 4.h),
            Row(
              children: List.generate(
                2,
                (index) => Row(
                  children: [
                    CustomTextBarWidget(
                      text: listMinimum[index],
                      textColor: ColorValue.primary90Color,
                      containerColor: ColorValue.primary20Color,
                    ),
                    SizedBox(width: 8.w),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTermsAndCons() {
    TextTheme textTheme = TextTheme.of(context);
    return Container(
      padding: EdgeInsets.all(16.w),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: ColorValue.primary20Color),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Ketentuan dan Persyaratan:", style: textTheme.bodyLarge),
          SizedBox(height: 8.h),
          Column(
            children: List.generate(
              3,
              (index) => Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/checkbox.svg",
                    height: 12.h,
                    width: 12.w,
                  ),
                  SizedBox(width: 8.w),
                  SizedBox(
                    width: 288.w,
                    child: Text(
                      listTermsAndCons[index],
                      style: textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescScholar() {
    TextTheme textTheme = TextTheme.of(context);

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: ColorValue.primary20Color),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Deskripsi Beasiswa:", style: textTheme.bodyLarge),
          SizedBox(height: 8.h),
          Text(
            "Siapkah kamu menjadi bagian dari Future Shapers & Changemakers bersama Townhall Muda dan 30 Pemimpin Muda Inspiratif lainnya untuk membawa dampak besar bagi daerahmu dan Indonesia?",
            style: textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineContent() {
    TextTheme textTheme = TextTheme.of(context);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.w),
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorValue.primary90Color,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(8.r),
              topLeft: Radius.circular(8.r),
            ),
          ),
          child: Text(
            "Timeline",
            style: textTheme.bodyLarge!.copyWith(color: Colors.white),
          ),
        ),
        Container(
          padding: EdgeInsets.all(16.w),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: ColorValue.primary20Color),
              // Border kiri
              right: BorderSide(color: ColorValue.primary20Color),
              // Border kanan
              bottom: BorderSide(
                color: ColorValue.primary20Color,
              ), // Border bawah
            ),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(8.r),
              bottomLeft: Radius.circular(8.r),
            ),
          ),
          child: Column(
            children: [
              // Timeline.builder(
              //   physics: NeverScrollableScrollPhysics(),
              //   context: context,
              //   properties: TimelineProperties(
              //     lineColor: Colors.blue,
              //     iconAlignment: MarkerIconAlignment.center,
              //     iconSize: 12.h,
              //     timelinePosition: TimelinePosition.start,
              //   ),
              //   markerCount: steps.length,
              //
              //   markerBuilder:
              //       (context, index) => Marker(
              //         child: Text(
              //           "Step ${index + 1} asdsa oda dsap ask d;ad a;ksd sa; saksakd ;a kda \n \n asoda dka ad as ",
              //         ),
              //         icon: index >= 2 ? emptyIcon : checkIcon,
              //         position: MarkerPosition.left,
              //       ),
              // ),
              TimelineWidget(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatusContent() {
    TextTheme textTheme = TextTheme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2 - 8.w,
          decoration: BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/card_start_date.svg",
                    color: ColorValue.secondary90Color,
                    width: 12.w,
                    height: 12.h,
                  ),
                  SizedBox(width: 4.w),
                  Text("Mulai Pendidikan", style: textTheme.bodySmall),
                ],
              ),
              SizedBox(height: 4.h),
              Text("03 Januari 2025", style: textTheme.bodyLarge),
              SizedBox(height: 8.h),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/card_end_date.svg",
                    color: ColorValue.secondary90Color,
                    width: 12.w,
                    height: 12.h,
                  ),
                  SizedBox(width: 4.w),
                  Text("Penutup Pendaftaran", style: textTheme.bodySmall),
                ],
              ),
              SizedBox(height: 4.h),
              Text("05 Januari 2025", style: textTheme.bodyLarge),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2 - 24.w,
          decoration: BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/form_building_filled.svg",
                    color: ColorValue.secondary90Color,
                    width: 12.w,
                    height: 12.h,
                  ),
                  SizedBox(width: 4.w),
                  Text("Penyelenggara", style: textTheme.bodySmall),
                ],
              ),
              SizedBox(height: 4.h),
              Text("(Nama Penyelenggara)", style: textTheme.bodyLarge),
              SizedBox(height: 8.h),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/card_money_bag.svg",
                    color: ColorValue.secondary90Color,
                    width: 12.w,
                    height: 12.h,
                  ),
                  SizedBox(width: 4.w),
                  Text("Tipe Pendanaan", style: textTheme.bodySmall),
                ],
              ),
              SizedBox(height: 4.h),
              Text("Fully Funded", style: textTheme.bodyLarge),
            ],
          ),
        ),
      ],
    );
  }
}

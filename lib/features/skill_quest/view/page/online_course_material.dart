import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycareer_new/core/custom_widgets/custom_app_bar_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_button_widget.dart';
import 'package:mycareer_new/core/theme/color_value.dart';
import 'package:mycareer_new/features/skill_quest/view/widget/online_course_material_card.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class OnlineCourseMaterial extends StatelessWidget {
  const OnlineCourseMaterial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Scaffold(
      appBar: CustomAppBarWidget(title: "UI/UX Designer"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [_firstCard(context), _secondCard(context)],
              ),
              SizedBox(height: 16.h),
              CustomButtonWidget(
                label: "Download Sertifikat",
                color: ColorValue.secondary60Color,
                onPressed: () {},
              ),
              SizedBox(height: 16.h),
              _materialContent(context),
              SizedBox(height: 16.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: ColorValue.primary90Color,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Kerjakan Kuis", style: textTheme.labelLarge),
                    SvgPicture.asset(
                      "assets/icons/legless_arrow_right.svg",
                      height: 24.h,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              _studyCaseContent(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _firstCard(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Container(
      width: (MediaQuery.of(context).size.width - 16.w * 2 - 8.w) / 2,
      height: 93.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: ColorValue.primary20Color),
      ),
      child: Center(
        child: Row(
          children: [
            Container(
              height: 48.h,
              width: 48.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                color: ColorValue.primary20Color,
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/icons/skill_quest_book.svg",
                  width: 24.w,
                  height: 28.110000610351562.h,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Course", style: textTheme.bodySmall),
                SizedBox(height: 4.h),
                SizedBox(width: 76.w, child: Text("UI/UX Designer")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _secondCard(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Container(
      width: (MediaQuery.of(context).size.width - 16.w * 2 - 8.w) / 2,
      height: 93.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: ColorValue.primary20Color),
      ),
      child: Container(
        child: Row(
          children: [
            Container(
              child: CircularPercentIndicator(
                radius: 24.w,
                lineWidth: 6.0.w,
                percent: 0.8,
                reverse: true,
                center: Text("80%", style: textTheme.bodyLarge),
                progressColor: ColorValue.greenHueColor,
                backgroundColor: ColorValue.greenTintColor,
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/card_file.svg",
                      height: 12.h,
                      width: 12.w,
                    ),
                    SizedBox(width: 4.w),
                    Text("10 Materi", style: textTheme.bodySmall),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/card_quiz_symbol.svg",
                      height: 12.h,
                      width: 12.w,
                    ),
                    SizedBox(width: 4.w),
                    Text("1 Kuis", style: textTheme.bodySmall),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/card_project_symbol.svg",
                      height: 12.h,
                      width: 12.w,
                    ),
                    SizedBox(width: 4.w),
                    Text("1 Study Case", style: textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _materialContent(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Column(
      children: [
        Text("Materi", style: textTheme.bodyLarge),
        SizedBox(height: 16.h),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return OnlineCourseMaterialCard(
              title: "Pengenalan Figma",
              type: "Video",
            );
          },
        ),
      ],
    );
  }

  Widget _studyCaseContent(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: ColorValue.secondary90Color,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r),
              topRight: Radius.circular(8.r),
            ),
          ),
          child: Text(
            "Study Case",
            style: textTheme.bodyLarge!.copyWith(color: Colors.white),
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(8.r), bottomLeft: Radius.circular(8.r)),
            border: Border(
              right: BorderSide(color: ColorValue.secondary20Color),
              left: BorderSide(color: ColorValue.secondary20Color),
              bottom: BorderSide(color: ColorValue.secondary20Color),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(8.w),
            color: ColorValue.secondary20Color,
            child: Text("Sebuah platform e-commerce melaporkan bahwa 80% pengguna yang memasukkan barang ke keranjang tidak menyelesaikan pembelian. Buat wireframe dan prototipe halaman checkout yang lebih intuitif dan mengurangi kemungkinan pengguna meninggalkan pembelian. Gunakan tools seperti Figma atau Adobe XD untuk membuat desain interaktif.", style: textTheme.bodySmall,),
          ),
        ),
        SizedBox(height: 52.h,)
      ],
    );
  }
}

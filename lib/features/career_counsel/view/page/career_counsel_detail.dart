import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycareer_new/core/custom_widgets/custom_app_bar_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_button_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_text_bar_widget.dart';
import 'package:mycareer_new/core/nav/nav.dart';
import 'package:mycareer_new/core/theme/color_value.dart';
import 'package:mycareer_new/features/career_counsel/view/page/career_conusel_booking.dart';

class CareerCounselDetailPage extends StatelessWidget {
  CareerCounselDetailPage({super.key});

  List<String> titleFirst = ["Jabatan", "Perusahaan", "Pengalaman"];
  List<String> titleSecond = ["Mangaer", "PT IYA", "5+ Tahun"];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Dinda Anggraini Wijayanto"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: ColorValue.primary20Color),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 311.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        "assets/images/career_counsel/profile_company.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 16.w),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextBarWidget(
                          text: "Bisnis",
                          textColor: ColorValue.greyColor,
                          containerColor: ColorValue.bgNavColor,
                        ),
                        SizedBox(width: 4.h),
        
                        CustomTextBarWidget(
                          text: "Akuntansi",
                          textColor: ColorValue.greyColor,
                          containerColor: ColorValue.bgNavColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 8.w),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        3,
                        (index) => Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            color: ColorValue.secondary20Color,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Column(
                            children: [
                              Text(
                                titleFirst[index],
                                style: textTheme.bodyMedium,
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                titleSecond[index],
                                style: textTheme.titleMedium!.copyWith(
                                  color: ColorValue.secondary90Color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      padding: EdgeInsets.all(16.r),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ColorValue.primary20Color,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Deskripsi Konsultas :",
                            style: textTheme.bodyLarge,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "Dinda adalah seorang Pebisnis sukses yang sudah merintis selama 100 tahun dengan 1000 pengalaman yang tidak kaleng - kaleng. Sudah pasti pengalamannya tidak diragukan",
                            style: textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h,),
              CustomButtonWidget(label: "Konsultasi Sekarang", onPressed: () {
                Nav.to(context, CareerConuselBookingPage());
              },)
            ],
          ),
        ),
      ),
    );
  }
}

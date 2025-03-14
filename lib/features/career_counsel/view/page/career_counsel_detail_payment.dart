import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycareer_new/core/custom_widgets/custom_app_bar_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_button_widget.dart';
import 'package:mycareer_new/core/nav/nav.dart';
import 'package:mycareer_new/core/theme/color_value.dart';
import 'package:mycareer_new/features/career_counsel/view/page/career_counsel_list.dart';

class CareerCounselDetailPaymentPage extends StatefulWidget {
  const CareerCounselDetailPaymentPage({super.key});

  @override
  State<CareerCounselDetailPaymentPage> createState() =>
      _CareerCounselDetailPaymentPageState();
}

class _CareerCounselDetailPaymentPageState
    extends State<CareerCounselDetailPaymentPage> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Pembayaran"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: ColorValue.primary20Color),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12.w),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: ColorValue.primary20Color,
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/card_chats.svg",
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("CareerCounsel", style: textTheme.bodySmall),
                          SizedBox(height: 4.h),
                          Text("Dinda Anggraini", style: textTheme.bodyLarge),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text("Rp 60.000", style: textTheme.titleMedium),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: ColorValue.primary20Color),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Detail: ", style: textTheme.bodyLarge),
                  SizedBox(height: 8.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(3, (index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/check_box.svg",
                                height: 12.h,
                                width: 12.w,
                              ),
                              SizedBox(width: 8.w),
                              Text("Mendapat feedback dari konsul terbaik"),
                            ],
                          ),
                          SizedBox(height: 4.h,)
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
            Spacer(),
            CustomButtonWidget(label: "Bayar", onPressed: () {
              Nav.to(context, CareerCounselListPage(overlay: true,));
            },),
            SizedBox(height: 16.h,)
          ],
        ),
      ),
    );
  }
}

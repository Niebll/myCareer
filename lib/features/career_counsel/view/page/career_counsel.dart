import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycareer_new/core/custom_widgets/custom_app_bar_widget.dart';
import 'package:mycareer_new/core/theme/color_value.dart';
import 'package:mycareer_new/features/career_counsel/view/page/career_counsel_detail.dart';
import 'package:mycareer_new/features/career_counsel/view/page/career_counsel_list.dart';
import 'package:mycareer_new/features/career_counsel/view/widgets/career_counsel_card.dart';

import '../../../../core/nav/nav.dart';

class CareerCounselPage extends StatefulWidget {
  const CareerCounselPage({Key? key}) : super(key: key);

  @override
  State<CareerCounselPage> createState() => _CareerCounselPageState();
}

class _CareerCounselPageState extends State<CareerCounselPage> {
  List<String> filter = ["Semua", "IT dan Teknologi", "Bisnis", "Manufaktur"];
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Career Counsel"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      color: ColorValue.primary20Color
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 24.h,
                          width: 24.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset("assets/images/home/profile.png", fit: BoxFit.cover,),
                        ),
                        SizedBox(width: 8.w,),
                        Text("Dini Anjani P", style: textTheme.bodyMedium!.copyWith(color: ColorValue.primary90Color),),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Nav.to(context, CareerCounselListPage());
                    },
                    child: Container(
                      padding: EdgeInsets.all(7.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorValue.primary90Color
                      ),
                      child: SvgPicture.asset("assets/icons/button_chat.svg", height: 24.h, width: 24.w,),
                    ),
                  )
                ],
              ),
              SizedBox(height: 16.h,),
              Text("Temukan HR Terbaikmu!", style: textTheme.titleMedium,),
              SizedBox(height: 8.h,),
              Row(
                children: List.generate(4, (index) => Container(
                  margin: EdgeInsets.only(right: 8.w),
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorValue.primary90Color),
                    borderRadius: BorderRadius.circular(8.r)
                  ),
                  child: Text(filter[index], style: textTheme.bodySmall!.copyWith(
                    color: ColorValue.primary90Color
                  ),),
                ),),
              ),
              SizedBox(height: 16.h,),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 3,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Nav.to(context, CareerCounselDetailPage());
                    },
                    child: CareerCounselCard(image: "assets/images/career_counsel/profile_company.jpg", name: "Dinda Anggraini Wijayanto", jobType: "Bisnis", workExperience: "10 Tahun", price: "25.000"));
              },)
            ],
          ),
        ),
      ),
    );
  }
}

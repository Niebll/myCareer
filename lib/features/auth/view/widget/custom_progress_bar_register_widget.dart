import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/color_value.dart';


class CustomProgressBarRegisterWidget extends StatefulWidget {
  final int currentStep;
  const CustomProgressBarRegisterWidget({super.key, required this.currentStep});

  @override
  State<CustomProgressBarRegisterWidget> createState() => _CustomProgressBarRegisterWidgetState();
}

class _CustomProgressBarRegisterWidgetState extends State<CustomProgressBarRegisterWidget> {

  List<String> aTitle =[
    "Sebelum cari lowongan, yuk isi data diri!",
    "Apa pendidikan terakhirmu?",
    "Apa kamu sudah memiliki pengalaman kerja?",
    "Promosikan dirimu agar rekruter tertarik!",
    "Apa pekerjaan yang kamu cari? (Maks. 3)"
  ];
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(color: ColorValue.primary90Color, height: kToolbarHeight),
        Container(
          height: 119.h,
          width: MediaQuery.of(context).size.width,
          color: ColorValue.primary90Color,
          child: Row(
            children: [
              SizedBox(width: 14.w),
              SvgPicture.asset(
                'assets/icons/arrow_left.svg',
                height: 20.h,
                width: 20.w,
              ),
              SizedBox(width: 8.w),
              Container(
                height: 71.h,
                width: 320.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: EdgeInsets.only(
                  left: 16.w,
                  top: 18.h,
                  bottom: 16.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: List.generate(
                        8,
                            (index) => Container(
                          margin: EdgeInsets.only(right: 4.w),
                          height: 7.h,
                          width: 32.w,
                          decoration: BoxDecoration(
                            color: index < widget.currentStep
                                ? ColorValue.secondary90Color
                                : ColorValue.primary20Color,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      aTitle[widget.currentStep-1],
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30.h),


      ],
    );
  }
}

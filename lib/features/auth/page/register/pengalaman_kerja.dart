import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycareer_new/core/custom_widgets/custom_app_bar_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_button_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_tips_card_widget.dart';
import 'package:mycareer_new/core/nav/nav.dart';
import 'package:mycareer_new/core/theme/color_value.dart';
import 'package:mycareer_new/features/auth/page/register/pengalaman_kerja_detail.dart';

class PengalamanKerjaPage extends StatefulWidget {
  const PengalamanKerjaPage({Key? key}) : super(key: key);

  @override
  State<PengalamanKerjaPage> createState() => _PengalamanKerjaPageState();
}

class _PengalamanKerjaPageState extends State<PengalamanKerjaPage> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Pengalaman Kerja'),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            Text('Pengalaman Kerja', style: textTheme.bodyMedium),
            SizedBox(height: 8.h),
            Text(
              "Menambah pengalaman kerja adalah nilai plus. Namun tenang, sebagian rekruter tetap mempertimbangkan pelamar yang belum memiliki pengalaman",
              style: textTheme.bodySmall,
            ),
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: () {
                Nav.to(context, PengalamanKerjaDetailPage());
              },
              child: Container(
                width: 208.w,
                decoration: BoxDecoration(
                  color: ColorValue.primary90Color,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Center(
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/icons/form_plus.svg"),
                      SizedBox(width: 8.w),
                      Text(
                        'Tambah Pengalaman Kerja',
                        style: textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            CustomTipsCardWidget(text: "Tips : Kamu bisa melewati halaman ini jika belum memiliki pengalaman kerja"),
            Spacer(),
            CustomButtonWidget(label: "Selanjutnya", onPressed: () {}),
            SizedBox(height: 16.h),

          ],
        ),
      ),
    );
  }
}

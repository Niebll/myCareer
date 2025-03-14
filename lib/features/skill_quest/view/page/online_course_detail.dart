import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycareer_new/core/custom_widgets/custom_app_bar_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_button_widget.dart';
import 'package:mycareer_new/core/nav/nav.dart';
import 'package:mycareer_new/core/theme/color_value.dart';
import 'package:mycareer_new/features/skill_quest/view/page/online_course_detail_payment.dart';
import 'package:mycareer_new/features/skill_quest/view/page/online_course_material.dart';
import 'package:mycareer_new/features/skill_quest/view/widget/online_course_detail_card_widget.dart';

class OnlineCourseDetailPage extends StatefulWidget {
  final bool isPaid;
  const OnlineCourseDetailPage({super.key, this.isPaid = false});

  @override
  State<OnlineCourseDetailPage> createState() => _OnlineCourseDetailPageState();
}

class _OnlineCourseDetailPageState extends State<OnlineCourseDetailPage> {

  late bool overlay;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    overlay = widget.isPaid;
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          overlay = false;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Detail Learning Path"),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      _headContent(
                        "assets/images/skill_quest/course.png",
                        "UI-UX Designer",
                        "4,9",
                        "10",
                        "90",
                        "123.456",
                        "🎯Belajar & praktek 140+ materi tentang Marketing Management, Brand Strategy, Copywriting, Social Media, Campaign, Facebook Ads, Google Ads, TikTok Ads, SEO, CRM dan Influencer Marketing.",
                        '"Materi ini saya rancang dari 10 tahun lebih berkecimpung di multinational marketing agency dan tech companies. Terstruktur dan sesuai standar industri terkini. Yuk mulai menyelami materinya!" - Ryan Dwana, Business Director at Initiative - Global Media Agency.',
                      ),
                      SizedBox(height: 16.h),
                      CustomButtonWidget(
                        label: "Download Sertifikat",
                        onPressed: () {},
                        color: widget.isPaid ? ColorValue.secondary90Color : ColorValue.secondary60Color,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h,),
                SizedBox(
                  height: 204.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 16.w),
                    itemBuilder:
                        (context, index) => OnlineCourseDetailCardWidget(title: 'Materi', desc: 'Kuasai 140+ skill Digital Marketing, mulai dari membuat copywriting dan konten hingga optimalisasi berbagai channel seperti Social Media, Ads, SEO, dan CRM. Dibuat dan dikurasi oleh praktisi dari berbagai top companies asdsakdpakodask apskdapsk',)
                  ),
                ),
                SizedBox(height: 32.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: CustomButtonWidget(label: "Mulai Belajar", onPressed: () {
                    if(widget.isPaid)
                    Nav.to(context, OnlineCourseMaterial());
                    else
                      Nav.to(context, OnlineCourseDetailPaymentPage());
                  },),
                ),
                SizedBox(height: 22.5.h,)
              ],
            ),
            if (overlay)
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: ColorValue.greenTintColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset("assets/icons/check.svg"),
                      SizedBox(width: 8.w),
                      Text(
                        'Pembayaranmu Berhasil\nKamu bisa langsung Mulai Belajar',
                        style: textTheme.bodyMedium!.copyWith(
                          color: ColorValue.greenHueColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget _headContent(
    String image,
    String job,
    String rating,
    String topik,
    String materiCount,
    String viewsCount,
    String description,
    String tutorTesti,
  ) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border.all(color: ColorValue.primary20Color),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 222.h,
            width: double.infinity,
            child: Image.asset(image, fit: BoxFit.cover),
          ),
          SizedBox(height: 16.h),
          Text(job, style: textTheme.bodyLarge),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                "assets/icons/card_star.svg",
                width: 12.w,
                height: 12.h,
                color: ColorValue.primary90Color,
              ),
              SizedBox(width: 4.w),
              Text("$rating/5", style: textTheme.bodySmall),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                "assets/icons/card_file.svg",
                width: 12.w,
                height: 12.h,
                color: ColorValue.primary90Color,
              ),
              SizedBox(width: 4.w),
              Text("$topik topik", style: textTheme.bodySmall),
              SizedBox(width: 14.w),
              Container(
                height: 4.h,
                width: 4.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorValue.primary90Color,
                ),
              ),
              SizedBox(width: 10.w),
              Text("$materiCount Materi", style: textTheme.bodySmall),
              SizedBox(height: 4.h),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                "assets/icons/card_people_community.svg",
                width: 12.w,
                height: 12.h,
                color: ColorValue.primary90Color,
              ),
              SizedBox(width: 4.h),
              Text("$viewsCount views+", style: textTheme.bodySmall),
            ],
          ),
          SizedBox(height: 16.h),
          Text(description, style: textTheme.bodySmall),
          SizedBox(height: 24.h),
          Text("✅Testimoni Tutor:", style: textTheme.bodyMedium),
          SizedBox(height: 8.h),
          Text(tutorTesti, style: textTheme.bodySmall),
        ],
      ),
    );
  }
}

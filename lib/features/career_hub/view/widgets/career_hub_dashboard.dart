import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycareer_new/core/custom_widgets/custom_form_widget.dart';
import 'package:mycareer_new/features/career_hub/view/widgets/career_hub_post_card.dart';

class CareerHubDashboard extends StatefulWidget {
  const CareerHubDashboard({Key? key}) : super(key: key);

  @override
  State<CareerHubDashboard> createState() => _CareerHubDashboardState();
}

class _CareerHubDashboardState extends State<CareerHubDashboard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            _buildHeadContent(),
            SizedBox(height: 32.h),
            CustomFormWidget(
              label: "",
              hint: "Tambahkan Thread",
              svg: "form_user_filled.svg",
              textEditingController: TextEditingController(),
              minLines: 1,
              maxLines: 10,
              isSuffix: true,
              suffixIcon: "form_send_arrow.svg",
            ),
            SizedBox(height: 16.h,),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (context, index) {
              return CareerHubPostCard(img: "assets/images/career_hub/user.png", userName: "dinay", userUserName: "@ikanshisamo", postText: "Gue baru aja ditolak di tahap akhir interview. Ada yang pernah ngalamin? Gimana cara move on-nya, bro?", postHour: "21 jam", postComments: "100", postLikes: "100");
            },)
          ],
        ),
      ),
    );
  }

  Widget _buildHeadContent() {
    TextTheme textTheme = TextTheme.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7 - 32.w,
              height: 100.h,
              child: Center(
                child: Text(
                  "Networking Lebih Mudah, Karier Makin Cerah!",
                  style: textTheme.titleMedium,
                ),
              ),
            ),
            SvgPicture.asset(
              "assets/images/career_hub/image1.svg",
              height: 100.h,
              width: MediaQuery.of(context).size.width * 0.2 - 32.w,
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Text(
          "Temukan teman seperjuangan dan mentor yang siap membimbingmu menuju kesuksesan. Dapatkan motivasi, insight, dan peluang baru setiap hari!",
          style: textTheme.bodySmall,
        ),
      ],
    );
  }
}

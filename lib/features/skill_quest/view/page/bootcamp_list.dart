import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycareer_new/core/custom_widgets/custom_app_bar_widget.dart';
import 'package:mycareer_new/features/skill_quest/view/widget/bootcamp_list_card.dart';

class BootcampListPage extends StatelessWidget {
  const BootcampListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Daftar Bootcamp"),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView.builder(
          padding: EdgeInsets.only(top: 16.h),
          itemCount: 3,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                },
                child: BootcampListCard(img: "assets/images/skill_quest/bootcamp.png", name: "Bootcamp Future Ready", level: "Pemula", job: "UI/UX Designer"));
          },),
      ),
    );
  }
}

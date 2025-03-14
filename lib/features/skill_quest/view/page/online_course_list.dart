import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycareer_new/core/custom_widgets/custom_app_bar_widget.dart';
import 'package:mycareer_new/core/nav/nav.dart';
import 'package:mycareer_new/features/skill_quest/view/page/online_course_material.dart';
import 'package:mycareer_new/features/skill_quest/view/widget/online_course_list_card.dart';

class OnlineCourseListPage extends StatefulWidget {
  const OnlineCourseListPage({Key? key}) : super(key: key);

  @override
  State<OnlineCourseListPage> createState() => _OnlineCourseListPageState();
}

class _OnlineCourseListPageState extends State<OnlineCourseListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Daftar Course"),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView.builder(
          padding: EdgeInsets.only(top: 16.h),
          itemCount: 3,
          itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Nav.to(context, OnlineCourseMaterial());
            },
              child: OnlineCourseListCard(img: "assets/images/skill_quest/course.png", name: "UI/UX Designer", manyTopik: "10"));
        },),
      ),
    );
  }
}

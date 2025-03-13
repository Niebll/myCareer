import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mycareer_new/core/theme/color_value.dart';
import 'package:mycareer_new/features/skill_quest/view/widget/bootcamp.dart';

import '../../../../core/custom_widgets/custom_tab_indicator_secondary.dart';
import '../widget/online_course.dart';

class SkillQuestPage extends StatefulWidget {
  const SkillQuestPage({Key? key}) : super(key: key);

  @override
  State<SkillQuestPage> createState() => _SkillQuestPageState();
}

class _SkillQuestPageState extends State<SkillQuestPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Skill Quest'),
          leading: IconButton(
            icon: SvgPicture.asset("assets/icons/arrow_left.svg", color: ColorValue.netralColor,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48.h),
            child: Column(
              children: [
                Container(height: 1.h, color: ColorValue.primary20Color),
                Material(
                  elevation: 4,
                  color: Colors.white,
                  shadowColor: ColorValue.primary20Color,
                  child: TabBar(
                    labelStyle: textTheme.labelLarge,indicator: CustomTabIndicatorSecondary(),
                    labelColor: ColorValue.secondary90Color,
                    indicatorColor: ColorValue.secondary90Color,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: ColorValue.primary20Color,
                    tabs: [Tab(text: 'Online Course'), Tab(text: 'Bootcamp')],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  OnlineCourse(),
                  Bootcamp()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

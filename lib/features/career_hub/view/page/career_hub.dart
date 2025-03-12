import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mycareer_new/core/custom_widgets/custom_app_bar_widget.dart';
import 'package:mycareer_new/features/career_hub/view/widgets/career_hub_dashboard.dart';

import '../../../../core/custom_widgets/custom_tab_indicator.dart';
import '../../../../core/theme/color_value.dart';

class CareerHubPage extends StatefulWidget {
  const CareerHubPage({Key? key}) : super(key: key);

  @override
  State<CareerHubPage> createState() => _CareerHubPageState();
}

class _CareerHubPageState extends State<CareerHubPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('CareerHub'),
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/arrow_left.svg",
            color: ColorValue.netralColor,
          ),
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
                  indicator: CustomTabIndicator(),
                  controller: _tabController,
                  labelStyle: textTheme.labelLarge,
                  labelColor: ColorValue.primary90Color,
                  indicatorColor: ColorValue.primary90Color,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.white,
                  tabs: [
                    Tab(text: "Untukmu",),
                    Tab(text: "Balasan",),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(controller: _tabController, children: [
        CareerHubDashboard(),
        Container(),
      ]),
    );
  }
}

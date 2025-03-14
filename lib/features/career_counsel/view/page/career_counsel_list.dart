import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mycareer_new/core/custom_widgets/custom_app_bar_widget.dart';
import 'package:mycareer_new/features/career_counsel/view/page/career_counsel_chat_list.dart';
import 'package:mycareer_new/features/career_counsel/view/widgets/career_counsel_list_paid.dart';

import '../../../../core/custom_widgets/custom_tab_indicator.dart';
import '../../../../core/theme/color_value.dart';

class CareerCounselListPage extends StatefulWidget {
  bool overlay;

  CareerCounselListPage({super.key, this.overlay = false});

  @override
  State<CareerCounselListPage> createState() => _CareerCounselListPageState();
}

class _CareerCounselListPageState extends State<CareerCounselListPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          widget.overlay = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konsultasi'),
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
                  tabs: [Tab(text: "Terbayar"), Tab(text: "Pesan")],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            children: [CareerCounselListPaid(), CareerCounselChatList()],
          ),
          if (widget.overlay)
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
                      'Pembayaranmu Berhasil\nKamu bisa langsung Konsultasi',
                      style: textTheme.bodyMedium!.copyWith(
                        color: ColorValue.greenHueColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
